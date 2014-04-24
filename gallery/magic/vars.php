<?
	$the_websiteName = "livmershon.com";
	$the_websiteTitle = "Liv Mershon";
	$the_websiteTitleSeparator = " | ";
	$the_webAddress = "http://livmershon.com";

	$the_year = "2013";
	$the_createdBy = "housewithinahouse";
	$the_createdByLink = "http://housewithinahouse.com";

	$the_linksList = array(
									 array("a_href"=>"../", "menuButton_inner"=>"&laquo;", "menuname_inner"=>"Home"),
									 array("a_href"=>"../drawings", "menuButton_inner"=>"&curren;", "menuname_inner"=>"Drawings"),
									 array("a_href"=>"../printmaking", "menuButton_inner"=>"&#135;", "menuname_inner"=>"Printmaking"),
									 array("a_href"=>"../comics","menuButton_inner"=>"&#9633;", "menuname_inner"=>"Comics"),
									 array("a_href"=>"http://www.youtube.com/user/MammyFlammy/videos' target='_blank", "menuButton_inner"=>"&#9895;", "menuname_inner"=>"Mammy Flammy"),
									 array("a_href"=>"../badpsychic", "menuButton_inner"=>"&#9907;", "menuname_inner"=>"Bad Psychic"),
									 array("a_href"=>"../other", "menuButton_inner"=>"&plusmn;", "menuname_inner"=>"Other"),
									 array("a_href"=>"../about", "menuButton_inner"=>"&#9660;", "menuname_inner"=>"About"),
									 array("","","")
									);

	$the_pageName = "DEFAULT"; //should change on most pages.
	$the_pathToCSS = "/css/";
	$the_pathToJS = "/js/";
	

	//switches:
	$menu_skipCurrentPage = TRUE;
	$head_appendBasePath = FALSE; 

	class BasicWebElement
	/*
		-this is the superclass for everything that has:
			+$disp_string :: what is returned when the object is asked to display()
			+display() 		:: calls beforeDisplay(to wrap up whatever), echos $disp_string
			+append()			:: adds string to the end of $disp_string
			+prepend()		:: add string to begining of $disp_string.
			+beforeDisplay:: this is where you put any wrapup things (like closing tags).

	*/
	{
		protected $disp_string;
		public function __toString(){
			$this->beforeDisplay();
			return $this->disp_string;
		}
		public function prepend(){
			foreach(func_get_args() as $string){
				$this->disp_string = $string . $this->disp_string;
			}
		}
		public function append(){
			foreach(func_get_args() as $string){
				$this->disp_string .= $string;
			}
		}
		protected function beforeDisplay(){
		}
		public function display(){
			$this->beforeDisplay();
			echo $this->disp_string;
		}
	}



	/**THIS IS ANOTHER BASIC CLASS*/
	class BasicMagicElement extends BasicWebElement
	{
		public $specs = array();

		public function __construct($specs){
			$this->set($specs);
		}
		public function set($specs){
			foreach ($specs as $key => $spec) {
		  	$this->specs[$key] = $spec;
		  }
		}
		public function openingTag($make_type){
			$return_string = "<$make_type";
		  foreach($this->specs as $key => $spec){
		  	if($this->specs[$key] !== NULL && $key !== "{$make_type}_inner" && preg_match("/{$make_type}_/", $key)){
		  		$propName = str_replace("{$make_type}_","", $key);
		  		$return_string .= " $propName='{$this->specs[$key]}'";
		  	}
			}
			return $return_string.">";
		}
		public function innerHTML($make_type){
			if($this->specs["{$make_type}_inner"]!==NULL){
				return $this->specs["{$make_type}_inner"];
			}
		}
		public function closingTag($make_type){
			return "</{$make_type}>";
		}
		public function add($make_type, $specs){
			$this->set( $specs );
			$this->append( $this->openingTag( $make_type ), $this->innerHTML( $make_type ), $this->closingTag( $make_type ) );
		}
		public function wrap($make_type, $specs){
			$this->set( $specs );
			$this->prepend( $this->openingTag( $make_type ) );
			$this->append( $this->innerHTML( $make_type ) ,$this->closingTag( $make_type ) );
		}
	}

	class BasicMagicGroup extends BasicMagicElement
	{
		public $elementGroup; //holds the array of BasicMagicElements (or child classes)

		public function __construct($specs)
		{
			parent::__construct($specs); //Group uses the $specs as a prototype for elements in the group.
		}
		public function make($obj_type, $specs) //add new BasicMagicElement onto end of
		{
			$this->elementGroup[] = new $obj_type($specs);
		}
		public function makeFromArray($obj_type, $arrayOfSpecs)
		{
			foreach($arrayOfSpecs as $specs)
			{
				$tempSpecs = $this->specs;
				foreach ($specs as $key => $spec)
				{
					$tempSpecs[$key] = $spec;
				}
				$this->make($obj_type, $tempSpecs);
			}
		}
		public function addEach($make_type, $specs)
		{
			foreach($this->elementGroup as $element)
			{
				$element->add($make_type, $specs);
			}
		}
		public function setEach($specs){
			foreach($this->elementGroup as $element)
			{
				$element->set($specs);
			}
		}
		public function wrapEach($make_type, $specs)
		{
			foreach($this->elementGroup as $element)
			{
				$element->wrap($make_type, $specs);
			}
		}
		protected function beforeDisplay(){
			foreach($this->elementGroup as $element)
			{
				$this->append($element);
			}
		}

		//more specialzied makeFrom's
		public function makeFromImages($obj_type, $specs){
			if ($handle = opendir('./images')) {
				while (false !== ($entry = readdir($handle))) {
					if ($entry != "." && $entry != "..") {
						//if(preg_match("/_thumb.jpg/", $entry)){
							$specs["img_src"] = "images/{$entry}"; //what if we take the glob array and turn each entry into a figure object?
							$specs["a_href"] = "images/{$entry}";
							$this->make($obj_type, $specs);

						//}
					}
				}
				closedir($handle);
			}
		}
		public function makeFromFiles($obj_type, $directory, $specs){
			if ($handle = opendir($directory)) {
				while (false !== ($entry = readdir($handle))) {
					if ($entry != "." && $entry != "..") {
						//if(preg_match("/_thumb.jpg/", $entry)){
							$specs["img_src"] = "{$directory}/{$entry}"; //what if we take the glob array and turn each entry into a figure object?
							$specs["a_href"] = "{$directory}/{$entry}";
							$this->make($obj_type, $specs);

						//}
					}
				}
				closedir($handle);
			}
		}
	}
		?>
		
		
