<?
	function get_images($folder, $image_type, $text, $sketch_name, $display_all_images = FALSE, $test_mode = TRUE){

		//get all the images.
		$images = glob("images/$folder/*.jpg");
		shuffle($images);

		//this breaks up the images into an array of arrays, keyed up by the image ID.
		foreach ($images as $image) {
			$current_image_id = substr(end(explode($image_type, $image)),0, 3);
			$all_images[$current_image_id][] = $image;
		}

		$line_types = array( //these are used for formating the images, so they look pretty.
			array ("double", "double"),
			array ("triple", "triple", "triple"),
			array ("quadruple", "quadruple", "quadruple", "quadruple"),
			array ("double", "quadruple", "quadruple", "quadruple", "quadruple"),
			//array ("quadruple", "quadruple", "double", "quadruple", "quadruple")
		);

		$images_counter = 0;
		$current_line_type = $line_types[array_rand($line_types)];

		//the actual print things to the screen part
		if(!$display_all_images){
			$images = array();
			foreach($all_images as $image_group){
				$images[] = $image_group[array_rand($image_group)];
			}
		}
		$text_display = FALSE;
		$text_trigger = TRUE;
		$sketch_display = FALSE;
		foreach ($images as $image) {
			if($images_counter >= count($current_line_type)){
				$images_counter = 0;
				$current_line_type = $line_types[array_rand($line_types)];
				if($text_trigger){
					$current_line_type = array("double", "double");
					$text_display = TRUE;
					$text_trigger = FALSE;
				}
			}
			$figure_class = $current_line_type[$images_counter];
			if ($sketch_display && $sketch_name !== ""){
				?>
					<article>
						<script src="/gallery/processing-js/processing-1.4.1.min.js"></script>
							<canvas data-processing-sources="<?echo $sketch_name; ?>" class="single">
						</canvas>
					</article>
				<?
				$sketch_display = FALSE;
			}
			if($text_display && $text !== ""){
				echo "<div class='description $figure_class' style=float:left>".$text."</div>"; 
				$text_display = FALSE;
				$sketch_display = TRUE; 
				$images_counter++;
			}
			$current_image_id = substr(end(explode($image_type, $image)),0, 3);
			echo "<a href=images/full-size/$image_type".$current_image_id.".jpg>";
			echo "<figure class={$figure_class}><img src='$image'>";
			echo "<figcaption>$image_type $current_image_id</figcaption></figure></a>";

			$images_counter++;
		}
		if($test_mode){
			echo "<p><pre>";
			var_dump($all_images);
		}
	}

?>
