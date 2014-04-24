<?
	$stylesheet = "../../css/main.less";
	$title = "Cancer | Itterations";
	$text = "<h1> Cancer | Itterations</br>
					&#151; 2014 &#151;	</h1>
					<p>
				    These shapes are malignant growths, starting from a tiny circle, we add in new inclusions, and draw a shape that contains the mass. They grow wild across the page, each new layer larger than the rest.
				    <p>There was a struggle on what to call this. On one hand, we see landscapes, topographical dreams on worlds never seen, on the other, we see inside of you, where things we don't want growing live. But our landscapes look unnatural, like a world unmade and rebuilt in too presise momuments.";
	include_once '../head.php';
	include_once '../gallery.php';
?>
	<body>
		<?include_once '../top.php'?>
		<div class="images">
				<?
					get_images('720x720',"cancer", $text, "", FALSE, FALSE);
					//get_images('1440x720', FALSE, FALSE);
				?>
		</div>
