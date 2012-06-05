<%@Page Language="JScript" ResponseEncoding="utf-8" Debug="true" validateRequest="false"%><!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Pending Approval | DealingTree</title>
		<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
		<!--[if IE]>
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<![endif]-->
		<link rel="stylesheet" href="/css/all-styles.css"/>
		<!--[if IE]>
		<link rel="stylesheet" href="/css/ie.css"/>
		<![endif]-->
		<!--[if lte IE 7]>
		<link rel="stylesheet" href="/css/ie7.css"/>
		<![endif]-->
		<!--[if lte IE 6]>
		<link rel="stylesheet" href="/css/ie6.css"/>
		<![endif]-->
		<script src="/js/jquery.js"> </script>
		<script src="/js/help-window.js"> </script>
		<script src="/js/modernizr.js"> </script>
		<script src="/js-webshim/minified/polyfiller.js"> </script>
		<script src="/js/INIT.js"> </script>
	</head>
	<body><header role="banner">			<nav>
				<menu>
					<li>
						<a href="/">Home</a>
					</li>
					<li>
						<a href="/join/">Join</a>
					</li>
					<li>
						<a href="/chirps/">Chirps</a>
					</li>
					<li>
						<a href="/savings/">Savings</a>
					</li>
					<li>
						<a href="/demo/">Demo</a>
					</li>
					<li>
						<a href="/help/" id="helpLink">Help</a>
					</li>
				</menu>
			</nav>
			<hgroup>
				<h1>DealingTree</h1>
				<h2>Deals Around the Corner and Around the World!</h2>
			</hgroup>
		</header><article>
			<h1>Pending Approval</h1>
			<p>The following is how your deal will appear once approved.</p>
		</article>
				<%
					var url = Request.Form['imageData'];
					if ( ( ! (typeof (Request.Form['imageData']) !== 'undefined') ) || 
						( url == '' ) )
					{
						
							for ( var f in Request.Files )
							{
								var hpf = Request.Files[f];
								if (hpf.ContentLength != 0)
								{
									var name = 'tmp' + (new Date()).getTime() + '.jpg';
									hpf.SaveAs( System.IO.Path.Combine( AppDomain.CurrentDomain.BaseDirectory, 'added', name ) );
									url = '/added/' + name;
									break;
								}
							}
						
					}
				%>
				<article class="deal-detail">
					<%Response.Write('<img alt="[deal described in text]" src="'+url+'" />');%>
					<hgroup>
				<h1>
							<%Response.Write(Request.Form['price']+' '+Request.Form['summary']);%>
						</h1>
				<h2>
							Save 
							<%Response.Write(Request.Form['savings']);%>
							<br/>
							<%Response.Write(Request.Form['vendor']);%>
						</h2>
				<h3>
							<%Response.Write(Request.Form['address']);%>
							<br/>
							<%Response.Write(Request.Form['market']);%>
						</h3>
			</hgroup><div class="deal-description">
				<p>
							<%Response.Write(Request.Form['details']);%>
						</p>
			</div><div style="clear:left;font-size:1px;"> </div></article><footer role="contentinfo">
			<p>
							Copyright DealingTree.
							All Rights Reserved. Use of this site is
							subject to our ridiculous terms and conditions, which you must read
							every ten minutes because that's how often we change them.  By
							using this site, you agree to all terms and conditions
							including your promise to name (or rename) your first-born child
							after our website, then pay us millions when we sue you for
							trademark infringement.  Because you have already used this site
							to access this page, you are already bound by these terms and
							conditions regardless of whether you agree to them or not, and
							whether or not you actually read this notice.
						</p>
		</footer></body>
</html>