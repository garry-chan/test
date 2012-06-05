<%@Page Language="JScript" ResponseEncoding="utf-8" Debug="true" validateRequest="false"%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Pending Approval | DealingTree</title>
		<meta http-equiv="content-type" content="text/html;charset=UTF-8"/>
		<link type="text/css" rel="stylesheet" href="/css/original.css"/>
		<!--[if lte IE 7]>
		<link type="text/css" rel="stylesheet" href="/css/ie7.css"/>
		<![endif]-->
		<!--[if lte IE 6]>
		<link type="text/css" rel="stylesheet" href="/css/ie6.css"/>
		<![endif]-->
		<script type="text/javascript" src="/js/jquery.js"> </script>
		<script type="text/javascript" src="/js/help-window.js"> </script>
	</head>
	<body><div class="Header">			<div class="Navigation">
				<ul class="menu">
					<li>
						<a href="/">Home</a>
					</li>
					<li>
						<a href="/join/">Join</a>
					</li>
					<li>
						<a href="/demo/">Demo</a>
					</li>
					<li>
						<a href="/help/" id="helpLink">Help</a>
					</li>
				</ul>
			</div>
			<!--(end Navigation)-->
			<div class="Headings">
				<h1>DealingTree</h1>
				<div class="SubTitle1">Deals Around the Corner and Around the World!</div>
			</div>
			<!--(end Headings)-->
		</div><!--(end Header)--><div class="SelfContained">
			<h2 class="Title">Pending Approval</h2>
			<p>The following is how your deal will appear once approved.</p>
		</div><!--(end SelfContained)-->
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
				<div class="SelfContained deal-detail">
					<%Response.Write('<img alt="[deal described in text]" src="'+url+'" />');%>
					<div class="Headings">
				<h2 class="Title">
							<%Response.Write(Request.Form['price']+' '+Request.Form['summary']);%>
						</h2>
				<div class="SubTitle1">
							Save 
							<%Response.Write(Request.Form['savings']);%>
							<br/>
							<%Response.Write(Request.Form['vendor']);%>
						</div>
				<div class="SubTitle2">
							<%Response.Write(Request.Form['address']);%>
							<br/>
							<%Response.Write(Request.Form['market']);%>
						</div>
			</div><!--(end Headings)--><div class="deal-description">
				<p>
							<%Response.Write(Request.Form['details']);%>
						</p>
			</div><div style="clear:left;font-size:1px;"> </div></div><!--(end SelfContained)--><div class="Footer">
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
		</div><!--(end Footer)--></body>
</html>