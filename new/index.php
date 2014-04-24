<style>
@import url(http://fonts.googleapis.com/css?family=Cutive);

body{
	line-height:2vw;
	font-size:2vw;
	font-family: 'Cutive', serif;
	margin:2vw;
	text-align:justify;
	//width:100.5vw;
	overflow-x:hidden;
	background:#bbb;
}
a{
	color:inherit;
	text-decoration:none;
}
h1{
	width:31.2vw;
	font-family:arial;
	font-size:9.3vw;
	background:red;
	margin:0;
	margin-right:2vw;
	margin-bottom:2vw;
	text-shadow:.5vw .5vw #455, 1vw 1vw #998;
	line-height:.9em;
	height:10vw;
	float:left;
	text-align:center;
}
span{
	color:red;
}
header{
	float:left;
	height:10vw;
	overflow:hidden;
	background:#455;
	width:96vw;
}
header p{
	margin:2vw;
	color:#998;
}

img{
	width:100%;
	position:relative;
	transition:all .1s;
	bottom:0;
}
img:hover{
	bottom:10%;
	transition:all 4s;
}
menu{
	width:31.2vw;
	background:#998;
	float:left;
	margin:0;
	padding:0;
	text-align:right;
	height:20vw;
}
menu.double{
	height:38vw;
	position:relative;
	right:-1.8vw;
}

ul{
	margin:0;
	padding:0;
	height:100%;
	list-style:none;
}
li{
	margin:2vw;
	padding:1vw;
	height:2vw;
	background:rgba(0,0,0,.2);
	color:black;
	text-align:center;
}
li:hover{
	background:rgba(0,0,0,.4);
}
li:hover .indicator{
	visibility:visible;
}
li.double{
	height:14vw;
}
li.rag{
	font-size:1.4vw;
	text-align:justify;
	line-height:1.5vw;
	text-indent:2vw;
}

.indicator{
	position:relative;
	z-index:2;
	border-color:red;
	visibility:hidden;
}

.indA{
	width:13vw;
	height:5vw;
	border-top:3px dashed red;
	border-right:3px dashed red;
	right:-26vw;
	top:-1vw;
}
.indB{
	width:33vw;
	height:0vw;
	border-top:3px dashed red;
	right:-26vw;
	top:-1vw;
}
.indC{
	width:58vw;
	height:5vw;
	border-bottom:3px dashed red;
	border-right:3px dashed red;
	right:-26vw;
	top:-6vw;
}
.indD{
	width:40vw;
	height:0vw;
	border-bottom:3px dashed red;
	border-left:3px dashed red;
	right:41vw;
	top:-1vw;
}

.indE{
	width:14vw;
	height:16vw;
	border-bottom:3px dashed red;
	border-left:3px dashed red;
	right:15vw;
	top:-17vw;
}
.indF{
	width:14vw;
	height:5vw;
	border-bottom:3px dashed red;
	border-left:3px dashed red;
	right:15vw;
	top:-6vw;
}

.highlights{
	float:left;
	width:63vw;
}

.box{
	margin:2vw 0 0 2vw;
	background:#655;
	float:left;
	overflow:hidden;
}
.single-height{
	height:16vw;
}
.single-width{
	width:18.9vw;
}
.double-height{
	height:34vw;
}
.double-width{
	width:39.8vw;
}


.no-bottom-margin{
	margin-bottom:0vw;
}
.negitive-bottom-margin{
	margin-bottom:-1vw;
}


.horizonal-bar{
	background:#885;
	float:left;
	height:4vw;
	width:96vw;
}
.horizonal-bar--double{
	background:#885;
	float:left;
	height:10vw;
	width:96vw;
}

</style>
<h1 class="negitive-bottom-margin">ROBO</h1>
<header>
<h1>DRAW</h1>
<p>We make art that explores process. Pen-and-paper digital art. Creative code. Drawings by <span>robots</span>, for humans.
</header>
<menu>
	<ul>
		<a href="/gallery/olo"><li id="indAtitle" onmouseover="showInd('indA')" onmouseout="hideInd('indA')">OLO: Figure-8<div class="indicator indA" id="indAline"></div></a>
		<a href="/gallery/langolier"><li id="indBtitle" onmouseover="showInd('indB')" onmouseout="hideInd('indB')">Langolier: Spiral B<div class="indicator indB" id="indBline"></div></a>
		<a href="/gallery"><li id="indCtitle" onmouseover="showInd('indC')" onmouseout="hideInd('indC')">Landscapes: Itterated<div class="indicator indC" id="indCline"></div></a>
	</ul>
</menu>
<div class="highlights">
	<a href="/gallery/olo">
		<div class="box single-height single-width trigA"
			 onmouseover="showInd('indA')" onmouseout="hideInd('indA')">
			<img src="/gallery/olo/images/olo002c.jpg">
		</div>
	</a>
	<a href="/gallery/langolier">
		<div class="box single-height single-width trigB"
			 onmouseover="showInd('indB')" onmouseout="hideInd('indB')">
			<img src="/gallery/langolier/images/lang004c2.jpg">
		</div>
	</a>
	<a href="/gallery">
		<div class="box single-height single-width"
			  onmouseover="showInd('indC')" onmouseout="hideInd('indC')">
			<img src="/gallery/images/720x720/fort001c2.jpg">
		</div>
	</a>
</div>
<div class="horizonal-bar"></div>

<div class="highlights">
	<div class="box double-height double-width trigD" onmouseover="showInd('indD')" onmouseout="hideInd('indD')">
		<img src="/gallery/images/720x720/RDCTUMBLRICON.png">
	</div>
	<a href="/gallery">
		<div class="box single-height single-width" onmouseover="showInd('indE')" onmouseout="hideInd('indE')">
			<img src="/gallery/images/720x720/dontdie2c.jpg" >
		</div>
	</a>
	<div class="box single-height single-width" onmouseover="showInd('indF')" onmouseout="hideInd('indF')"><img src="/gallery/images/720x720/cube004c.jpg"></div>
</div>
<menu class="double">
	<ul>
		<li class="double rag">We're exhibiting at The Combine! April 12th, 2014. If your This isn't a monster's home, it's our home and we're staying until the light of dawn. Push back the clean grasses of summer houses and ask yourself if this is the best thing going. I hope this isn't the <span>end</span></li>
		<li id="indDtitle" onmouseover="showInd('indD')" onmouseout="hideInd('indD')">Process: About <div class="indicator indD" id="indDline" ></div>
		<a href="/gallery"><li id="indEtitle" onmouseover="showInd('indE')" onmouseout="hideInd('indE')">Older: Archive<div class="indicator indE" id="indEline" ></div></a>
		<li id="indFtitle" onmouseover="showInd('indF')" onmouseout="hideInd('indF')">Talk: Contact<div class="indicator indF" id="indFline"></div>
	</ul>
</menu>
<header>
	<p>There isn't anything to <span>forgive</span> or forget, all of this is happening right now, in this moment and there's nothing you, of all people, can do to stop it, so don't worry, forget flight, and escape into the endless <span>night</span>.
</header>

<script>
	function showInd(indicator){
		line = indicator+'line';
		title = indicator+'title';
		document.getElementById(line).style.visibility="visible";
		document.getElementById(title).style.background="rgba(0,0,0,.4)";
	}
	function hideInd(indicator){
		line = indicator+'line';
		title = indicator+'title';
		document.getElementById(line).style.visibility="hidden";
		document.getElementById(title).style.background="rgba(0,0,0,.2)";
	}

</script>
