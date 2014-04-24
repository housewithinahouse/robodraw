<?
	include_once 'vars.php';
	include_once 'head.php';
	$head = new Head();
	$head->addLess("main.less");
	echo $head;

?>
	</head>
	<body>
		<?
			$gallery_specs = array("img_class"=>"squares");
			$gallery = new BasicMagicGroup();
			$gallery->makeFromImages("BasicMagicElement", $gallery_specs);
			$gallery->addEach("img");
			$gallery->wrapEach("a");
			echo "$gallery";
		?>
	</body>
</html>
