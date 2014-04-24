<?php
	include_once 'vars.php';
	$test_specs = array("a_href"=>"test");
	$test = new BasicMagicGroup();
	$test->makeFromImages("BasicMagicElement", $test_specs);
	$test->addEach("img");
	$test->wrapEach("a");
	echo "$test";
?>
<h4>BASIC MAGIC GROUP</h4>
<xmp>
<?var_dump($test);?>
</xmp>

<?
	class Menu extends BasicWebElement
	{
		public $nav_class;
		public function __construct($nav_class)
		{
			$this->nav_class = $nav_class;
			$this->set($specs);
			global $the_linksList, $the_pageName, $menu_skipCurrentPage;
			for($i = 0; $i < count($the_linksList); $i++) //for each link in $linksList
			{
				if($the_linksList[$i][2] === $the_pageName && $menu_skipCurrentPage)
				{
					continue;	//don't display link to current page
				}
				$this->append($this->addMenuButton($the_linksList[$i]));
			}
		}
		public function addMenuButton($linkInfoArray, $button_type = "menuButton"){
			$return_string = "";
			$return_string .= "<a href='". $linkInfoArray[0] ."'>"; //<a href="$url">
			$return_string .= "<$button_type>".$linkInfoArray[1]; //<menubutton>$buttonSymbol
			$return_string .= "<menuname>".$linkInfoArray[2]; //<menuname>$buttonName
			$return_string .= "</menuname></$button_type></a>";
			return $return_string;
		}
		protected function beforeDisplay(){
			$this->prepend("<nav class='$this->nav_class'>");
			$this->append("</nav>");
		}
	}


	function makeCredits($size = "h2", $creditsSeparator = " &mdash; ")
	{
		global $the_websiteName, $the_year, $the_createdBy, $the_createdByLink;
		return("<$size>".$the_websiteName.$creditsSeparator.$the_year.$creditsSeparator."<a href='".$the_createdByLink."'>".$the_createdBy."</a></$size>");
	}
?>
