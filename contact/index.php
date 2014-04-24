<!-- /contact/index.php -->
<?
	$stylesheet = "/css/main.less";
	$title = "Contact | Robotic Drawing Collective";
	include_once "../gallery/head.php";
	include_once "../gallery/top.php";
?>
<div class="text-box" id="contact-header">
	<a href="mailto:efallwel@gmail.com">
		<h3>Contact Us!</h3>
		<p>We'd love to hear from you, drop us a line about anything: robots, art, making cool things for you/with you/about you.
	</a>
</div>

<div id="contact-area" class="contact">
	<form method="post" action="contactengine.php">
		<div class="form-entry">
			<label for="Name">NAME</label>
			<input type="text" name="Name" id="Name">
		</div>
		<div class="form-entry">
			<label for="City">PLACE</label>
			<input type="text" name="City" id="City">
		</div>

		<div class="form-entry">
			<label for="Email">EMAIL</label>
			<input type="text" name="Email" id="Email">
		</div>
		<div class="form-entry">
			<label for="Message">WORDS</label><br>
			<textarea name="Message" rows="20" cols="20" id="Message"></textarea>
		</div>
		<div class="form-entry">
			<input type="submit" name="submit" value="Submit" class="submit-button" />
		</div>
	</form>
</div>
