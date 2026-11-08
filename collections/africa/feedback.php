<?php
/* SNA feedback, PHP 7.4+; requires configured mail delivery on the server. */
header('Content-Type: text/html; charset=UTF-8');
header('X-Content-Type-Options: nosniff');
header('Referrer-Policy: strict-origin-when-cross-origin');
session_start();
if (!isset($_SESSION['sna_challenge'])) {
    $_SESSION['sna_challenge'] = [random_int(1, 9), random_int(1, 9)];
}
$error = '';
$success = false;
function h($s) { return htmlspecialchars((string)$s, ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8'); }
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim((string)($_POST['name'] ?? ''));
    $email = trim((string)($_POST['email'] ?? ''));
    $subject = trim((string)($_POST['subject'] ?? 'General feedback'));
    $message = trim((string)($_POST['message'] ?? ''));
    $answer = trim((string)($_POST['verification'] ?? ''));
    $token = (string)($_POST['csrf'] ?? '');
    if (!hash_equals((string)($_SESSION['sna_csrf'] ?? ''), $token) || $token === '') $error = 'Session expired. Please reload and try again.';
    elseif (!empty($_POST['website'])) $error = 'Message not accepted.';
    elseif (strlen($name)>150 || strlen($email)>254 || strlen($subject)>150 || strlen($message)>10000) $error = 'Please shorten your message.';
    elseif ($name==='' || $message==='' || !filter_var($email,FILTER_VALIDATE_EMAIL)) $error = 'Please complete the required fields with a valid email address.';
    elseif ($answer==='' || !ctype_digit($answer) || (int)$answer !== array_sum($_SESSION['sna_challenge'])) $error = 'Incorrect verification answer.';
    elseif (time()-(int)($_SESSION['sna_last_sent'] ?? 0)<60) $error = 'Please wait one minute before sending another message.';
    else {
        $safeName = preg_replace('/[\r\n]+/', ' ', $name);
        $safeSubject = preg_replace('/[\r\n]+/', ' ', $subject);
        $body = "SNA Feedback Form\n\nName: {$safeName}\nEmail: {$email}\nSubject: {$safeSubject}\n\nMessage:\n{$message}\n";
        $headers = "From: SNA Feedback <no-reply@sna-on.postalstamps.biz>\r\n";
        $headers .= "Reply-To: {$email}\r\nContent-Type: text/plain; charset=UTF-8\r\n";
        if (@mail('victor.manta@gmail.com', 'SNA Feedback: '.$safeSubject, $body, $headers)) {
            $success = true;
            $_SESSION['sna_last_sent'] = time();
        } else $error = 'The server could not send the message. Please try again later.';
    }
    $_SESSION['sna_challenge'] = [random_int(1, 9), random_int(1, 9)];
}
$_SESSION['sna_csrf'] = bin2hex(random_bytes(16));
?><!doctype html>
<html lang="en"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Feedback Form | Spanish Africa and SNA on Stamps</title>
<style>
:root{color-scheme:light}body{margin:0;background:#f6f0dc;color:#283341;font:16px/1.5 Arial,sans-serif}header{background:#233f60;color:white;padding:18px max(20px,calc((100vw - 850px)/2))}header a{color:white}main{max-width:750px;margin:24px auto;padding:0 20px 50px}h1{color:#29435e}form{background:#fff;padding:24px;border:1px solid #dfd6c3;border-radius:9px}label{display:block;font-weight:bold;margin-top:15px}input,select,textarea{box-sizing:border-box;width:100%;padding:10px;margin-top:5px;font:inherit;border:1px solid #a9afba;border-radius:4px}textarea{min-height:160px}button{background:#294b6e;color:white;border:0;border-radius:5px;padding:12px 22px;font:inherit;cursor:pointer;margin-top:20px}.error{color:#a12626}.success{color:#176438}small{color:#59606b}.trap{position:absolute;left:-10000px} .gtranslate_wrapper{float:right;min-height:32px}header::after{content:"";display:block;clear:both}
</style></head><body><header><div class="gtranslate_wrapper"></div><a href="index.html">Spanish Africa and SNA on Stamps</a></header><main><h1>Contact &amp; Feedback</h1><p>Questions, comments and corrections about Spanish Africa and SNA on Stamps are welcome.</p>
<?php if ($success): ?><p class="success" role="status">Thank you! Your message was accepted by the mail server.</p><?php else: ?>
<?php if ($error): ?><p class="error" role="alert"><?=h($error)?></p><?php endif; ?>
<form action="feedback.php" method="post"><input type="hidden" name="csrf" value="<?=h($_SESSION['sna_csrf'])?>"><div class="trap" aria-hidden="true"><label>Website <input name="website" tabindex="-1" autocomplete="off"></label></div>
<label for="name">Name *</label><input id="name" name="name" maxlength="150" required value="<?=h($_POST['name'] ?? '')?>">
<label for="email">Email *</label><input id="email" type="email" name="email" maxlength="254" required value="<?=h($_POST['email'] ?? '')?>">
<label for="subject">Subject</label><select id="subject" name="subject"><option>General feedback</option><option>Correction</option><option>Question</option><option>Technical issue</option></select>
<label for="message">Message *</label><textarea id="message" name="message" maxlength="10000" required><?=h($_POST['message'] ?? '')?></textarea>
<label for="verification">Verification code * — What is <?=(int)$_SESSION['sna_challenge'][0]?> + <?=(int)$_SESSION['sna_challenge'][1]?>?</label><input id="verification" name="verification" inputmode="numeric" pattern="[0-9]+" required>
<button type="submit">Send message</button><p><small>* Required fields. The information is used only to respond to your message.</small></p></form>
<?php endif; ?><p><a href="index.html">Back to homepage</a></p></main>
<script>window.gtranslateSettings={default_language:'en',languages:['en','es','fr','de','ro','ru','zh-CN','it','pt'],wrapper_selector:'.gtranslate_wrapper',native_language_names:true};var s=document.createElement('script');s.src='https://cdn.gtranslate.net/widgets/latest/dropdown.js';s.defer=true;document.body.appendChild(s);</script>
</body></html>