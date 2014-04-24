<?
	$stylesheet = "../../css/main.less";
	$title = "OLO | Figure 8";
	$text = "<h1> LANGOLIER | TUBE</br>
					&#151; 2013 &#151;	</h1>
					<p>
				    Langolier, the second of our tools made in processing. So named beacuse it reminded us of the trails the worms that eat time left behind in our memories. 
				    <p>
				    Processing, a Java-ish language, was chosen, for it's elegent simplicity in drawing and manitpulating geomentry on the screen. We also had a book on it. olo.000 is the result of that, the figures you seen drawn here were all created using that. It's primative, limited, and still flawed, but we're proud to present it to you.
					<p>The controls are more than a little opaque:
					<br>--- click in the window to get started.
					<br>---- mouse controls the shape's position.
					<br>----- select slider with up/down arrow keys
					<br>------ adjust the sider using left/right arrow keys
					</p>
					<p>p.s. <a href='http://processingjs.org/'>processing.js</a> is awesome. ";
	include_once '../head.php';
	include_once '../gallery.php';
?>
	<body>
		<h1 class="main-logo">ROBO<br>DRAW</h1>
		<div class="images">
				<?
					get_images('720x720',"lang", $text, "langolier.pde Tug.pde slider.pde handlers.pde", FALSE, FALSE);
					//get_images('1440x720', FALSE, FALSE);
				?>
		</div>
