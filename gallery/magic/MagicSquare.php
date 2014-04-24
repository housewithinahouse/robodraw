<?php
include_once 'vars.php';

$test_specs = array(
						"a_href" => "/images/",
						"a_class" => "not"
						);
	$test = new BasicMagicElement($test_specs);
	$test->add("img",array("img_src"=>"/images/other.jpg"));
	$test->wrap("a");
	$test->add("figcaption",array("figcaption_inner"=>"test"));
	$test->wrap("div");
	echo ($test);

?>
<b>BASIC MAGIC FIGURE</b>
<xmp>
<?var_dump($test);?>
</xmp>
<?

/*class MagicFigure extends MagicSquare
{
	public $figcaption, $figlink;
	public function __construct(
	$img_src = "images/placeholder.jpg",
	$a_href = "#",
	$figcaption = "DEFAULT",
	$figlink = "> > > > > > >",
	$a_class = "default",
	$a_onclick = "return hs.expand(this)",
	$a_id = NULL
	)
	{}}

class MagicSquare extends BasicWebElement
{
  public $img_src, $a_class, $a_href, $a_onclick, $a_id;
  public function __construct(
	$img_src = "images/placeholder.jpg",
	$a_href = "#",
	$a_class = "default",
	$a_onclick = "return hs.expand(this)",
	$a_id = NULL
	)
	{
	$this->img_src = $img_src;
  	$this->a_class = $a_class;
  	$this->a_href = $a_href;
  	$this->a_onclick = $a_onclick;
  	$this->a_id = $a_id;
  }
  public function generate_a()
	{
		$this->prepend("<a id='{$this->a_id}' href='{$this->a_href}' class='{$this->a_class}' onclick='{$this->a_onclick}'>");
		$this->append("</a>");
	}
	public function generate_img()
	{
		$this->append("<img src='{$this->img_src}'>");
	}
	protected function beforeDisplay(){
		$this->generate_img();
		$this->generate_a();
		$this->prepend('<magicSquare>');
		$this->append('</magicSquare>');
	}
}
class MagicRectangle extends MagicSquare
{
	protected function beforeDisplay(){
		$this->generate_img();
		$this->generate_a();
		$this->prepend('<magicRectangle>');
		$this->append('</magicRectangle>');
	}
}*/
?>


<?php

$glob_magic = TRUE;
if($glob_magic) {
function globMagic($obj_type, $specs){ //use this to pass specs to the make grid-y things.
	foreach (glob("./images/*_thumb.jpg") as $entry) {
		$specs["img_src"] = "images/{$entry}"; //what if we take the glob array and turn each entry into a figure object?
		$specs["a_href"] = "images/".str_replace("_thumb","",$entry);
    $obj = new $obj_type($specs);
		$obj->display();
	}
}
}


function makeMagicFromImages($obj_type, $specs){
	if ($handle = opendir('./images')) {
		while (false !== ($entry = readdir($handle))) {
		  if ($entry != "." && $entry != "..") {
		  	if(preg_match("/_thumb.jpg/", $entry)){
		  		$specs["img_src"] = "images/{$entry}"; //what if we take the glob array and turn each entry into a figure object?
					$specs["a_href"] = "images/"."images/{$entry}";
					$obj = new $obj_type($specs);
					$obj->make_img("images/{$entry}");
					$specs_a_href = "images/"."images/{$entry}";
					$obj->make_a(array("a_href"=>$specs_a_href));
					$obj->display();
		  	}
			}
		}
		closedir($handle);
	}
}
//idea for poetry: make sure to ... like this page now, single square image, text underneath.
//   have new poems appear instantly on hover of poem title in menu, like rifiling through a book.


/*
function makeMagicFromImages($obj_type, $a_class = "default", $a_onclick = ""){
	if ($handle = opendir('./images')) {
		while (false !== ($entry = readdir($handle))) {
		  if ($entry != "." && $entry != "..") {
		  	if(preg_match("/_thumb.jpg/", $entry)){
		  		$obj = new $obj_type("images/{$entry}", "images/".str_replace("_thumb","",$entry), $a_class, $a_onclick);
		  		$obj->display();
		  	}
			}
		}
		closedir($handle);
	}
}

function makeFiguresFromImages($obj_type = "MagicFigure"){
	if ($handle = opendir('./images')) {
		while (false !== ($entry = readdir($handle))) {
		  if ($entry != "." && $entry != "..") {
		  	if(preg_match("/_thumb.jpg/", $entry)){
		  		$obj = new MagicFigure("images/{$entry}", str_replace("_thumb.jpg","",$entry).".html", strtoupper(str_replace("_thumb.jpg","",$entry)));
		  		$obj->display();
		  	}
			}
		}
		closedir($handle);
	}
}*/

?>
