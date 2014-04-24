<? ini_set('display_errors', 'On'); ?>
<html>
	<head>
		<title><?echo $title?></title>
		<link rel="stylesheet" type="text/less" href="<? echo $stylesheet ?>" />
		<script type="text/javascript"> <!-- less CONTROLS -->
			less = {
				env: "development", // or "production"
				async: false,       // load imports async
				fileAsync: false,   // load imports async when in a page under
																// a file protocol
				poll: 1000,         // when in watch mode, time in ms between polls
				functions: {},      // user functions, keyed by name
				dumpLineNumbers: "comments", // or "mediaQuery" or "all"
		};
		</script>
		<script src="/js/less.js" type="text/javascript"></script>
	</head>
