<?
	$stylesheet = "/css/main.less";
	$title = "OLO | Figure 8";
	$text = "<h1> olo | figure-8 </br>
				&#151; 2013 &#151;	</h1>
			<p>    
			'olo' is the tenative name to a shape we've been desiring to draw for some time. Our abortive, early, attempts at it only produced frustration and fatigue. The software we'd been using proved inadquete, it was time to write our own tools. 
			<p>
			Processing, a Java-ish language, was chosen, for it's elegent simplicity in drawing and manitpulating geomentry on the screen. We also had a book on it. olo.000 is the result of that, the figures you seen drawn here were all created using that. It's primative, limited, and still flawed, but we're proud to present it to you. 
			<p>The controls are more than a little opaque:
			<br>--- click in the window to get started. 
			<br>---- mouse controls the shape's position. 
			<br>----- select slider with up/down arrow keys
			<br>------ adjust the sider using left/right arrow keys
			</p>
			<p>p.s. <a href='http://processingjs.org/'>processing.js</a> is awesome. </p>";
	include_once '../head.php';
	include_once '../gallery.php';
?>

	<body>
		
		<div class="images">
				<?
					get_images('720x720',"olo", $text, "olo2_2a.pde olo2.pde handlers.pde", FALSE, FALSE);
				?>
		</div>
