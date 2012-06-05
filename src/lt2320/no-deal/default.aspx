<%@Page Language="JScript" ResponseEncoding="utf-8" Debug="true"%><%
					var marketName = '';
					var marketPos = Request.Form['market'];
					if ( marketPos )
					  Response.SetCookie( new HttpCookie('market',marketPos) );
					else
					{
						try { marketPos = Request.Cookies['market'].Value; }
						catch(e) { marketPos = ''; }
					}

					var inventory;
					try { inventory = Request.Cookies['inventory'].Value; }
					catch(e) { inventory = ''; }

					var sku = Request.Form['sku'];
					if ( sku )
					{
						inventory += '|' + sku + '|';
						Response.SetCookie( new HttpCookie('inventory',inventory) );
					}
					
					// the following is to sync the inventory after coming back online
					var sync = Request.Form['sync'];
					if ( sync )
					{
						inventory = sync;
						Response.SetCookie( new HttpCookie('inventory',inventory) );
					}
				%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>Home | DealingTree</title>
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
		</div><!--(end Header)-->
				<%
				// code for join validation
				var name = Request.Form['name'];
				if ( typeof (Request.Form['name']) !== 'undefined' )
				{
					var email = Request.Form['email'];
					var pass = Request.Form['pass'];
					var confirm = Request.Form['confirm'];
					var phone = Request.Form['phone'];
					var card = Request.Form['card'];
					var expires = Request.Form['expires'];
					var birth = Request.Form['birth'];
					try
					{
						if ( name.length < 3 )
							throw 'longer name';
						var at = email.indexOf('@');
						if ( ( at < 1 ) || ( at > email.length-5 ) || 
								( email.indexOf('.',at) <= at ) ) 
							throw 'valid email address';
						if ( pass.length < 4 )
							throw 'longer password';
						if ( ! ( confirm == pass ) )
							throw 'matching password confirmation';
						if ( ( phone.length < 6 ) || 
								( ! ( phone.replace(/[^0-9()-. ]/g,'') == phone ) ) )
							throw 'telephone number';
						if ( ( card.length < 12 ) || 
								( ! ( card.replace(/[^0-9 ]/g,'') == card ) ) )
							throw 'valid credit card number';
						if ( expires.length < 4 )
							throw 'valid credit card expiration date';
						if ( birth.length < 6 )
							throw 'valid birthdate';
						Response.Write('<article class="signupValid"><hgroup><h1>Thanks for signing up, '+escape(Request.Form['name'])+'!</h1></hgroup></article>');
					}
					catch(e)
					{
						Response.Write('<article class="signupInvalid"><hgroup><h1>You did not complete the signup form correctly.</h1><h2>Please click the Back Button and enter a '+e+'.</h2></hgroup></article>');
					}
				}
				%>
				<div id="rightContainer">
			<div class="SideBar">
				<p>
							The Buying Power of
							<strong id="memberCount">3,000,000</strong>
							Registered Members!
						</p>
			</div>
			<!--(end SideBar)-->
			<div class="SelfContained inventory" id="inventory"><div class="Headings">
					<h2 class="Title">Your Deals</h2>
					<div class="SubTitle1">(Purchases are Non-Refundable)</div>
				</div><!--(end Headings)-->
						<%
						
		if ( inventory.indexOf('Atlanta/sku01') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Atlanta/sku01/"><img alt="[deal described in text]" src="/images/deal/deal01.jpg" /></a>');
	
		if ( inventory.indexOf('Atlanta/sku02') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Atlanta/sku02/"><img alt="[deal described in text]" src="/images/deal/deal02.jpg" /></a>');
	
		if ( inventory.indexOf('Atlanta/sku03') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Atlanta/sku03/"><img alt="[deal described in text]" src="/images/deal/deal03.jpg" /></a>');
	
		if ( inventory.indexOf('Atlanta/sku04') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Atlanta/sku04/"><img alt="[deal described in text]" src="/images/deal/deal04.jpg" /></a>');
	
		if ( inventory.indexOf('Atlanta/sku05') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Atlanta/sku05/"><img alt="[deal described in text]" src="/images/deal/deal05.jpg" /></a>');
	
		if ( inventory.indexOf('Atlanta/sku06') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Atlanta/sku06/"><img alt="[deal described in text]" src="/images/deal/deal06.jpg" /></a>');
	
		if ( inventory.indexOf('Atlanta/sku07') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Atlanta/sku07/"><img alt="[deal described in text]" src="/images/deal/deal07.jpg" /></a>');
	
		if ( inventory.indexOf('Atlanta/sku08') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Atlanta/sku08/"><img alt="[deal described in text]" src="/images/deal/deal08.jpg" /></a>');
	
		if ( inventory.indexOf('Atlanta/sku09') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Atlanta/sku09/"><img alt="[deal described in text]" src="/images/deal/deal09.jpg" /></a>');
	
		if ( inventory.indexOf('Chicago/sku01') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Chicago/sku01/"><img alt="[deal described in text]" src="/images/deal/deal01.jpg" /></a>');
	
		if ( inventory.indexOf('Chicago/sku02') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Chicago/sku02/"><img alt="[deal described in text]" src="/images/deal/deal02.jpg" /></a>');
	
		if ( inventory.indexOf('Chicago/sku03') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Chicago/sku03/"><img alt="[deal described in text]" src="/images/deal/deal03.jpg" /></a>');
	
		if ( inventory.indexOf('Chicago/sku04') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Chicago/sku04/"><img alt="[deal described in text]" src="/images/deal/deal04.jpg" /></a>');
	
		if ( inventory.indexOf('Chicago/sku05') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Chicago/sku05/"><img alt="[deal described in text]" src="/images/deal/deal05.jpg" /></a>');
	
		if ( inventory.indexOf('Chicago/sku06') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Chicago/sku06/"><img alt="[deal described in text]" src="/images/deal/deal06.jpg" /></a>');
	
		if ( inventory.indexOf('Chicago/sku07') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Chicago/sku07/"><img alt="[deal described in text]" src="/images/deal/deal07.jpg" /></a>');
	
		if ( inventory.indexOf('Chicago/sku08') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Chicago/sku08/"><img alt="[deal described in text]" src="/images/deal/deal08.jpg" /></a>');
	
		if ( inventory.indexOf('Chicago/sku09') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Chicago/sku09/"><img alt="[deal described in text]" src="/images/deal/deal09.jpg" /></a>');
	
		if ( inventory.indexOf('London/sku01') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="London/sku01/"><img alt="[deal described in text]" src="/images/deal/deal01.jpg" /></a>');
	
		if ( inventory.indexOf('London/sku02') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="London/sku02/"><img alt="[deal described in text]" src="/images/deal/deal02.jpg" /></a>');
	
		if ( inventory.indexOf('London/sku03') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="London/sku03/"><img alt="[deal described in text]" src="/images/deal/deal03.jpg" /></a>');
	
		if ( inventory.indexOf('London/sku04') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="London/sku04/"><img alt="[deal described in text]" src="/images/deal/deal04.jpg" /></a>');
	
		if ( inventory.indexOf('London/sku05') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="London/sku05/"><img alt="[deal described in text]" src="/images/deal/deal05.jpg" /></a>');
	
		if ( inventory.indexOf('London/sku06') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="London/sku06/"><img alt="[deal described in text]" src="/images/deal/deal06.jpg" /></a>');
	
		if ( inventory.indexOf('London/sku07') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="London/sku07/"><img alt="[deal described in text]" src="/images/deal/deal07.jpg" /></a>');
	
		if ( inventory.indexOf('London/sku08') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="London/sku08/"><img alt="[deal described in text]" src="/images/deal/deal08.jpg" /></a>');
	
		if ( inventory.indexOf('London/sku09') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="London/sku09/"><img alt="[deal described in text]" src="/images/deal/deal09.jpg" /></a>');
	
		if ( inventory.indexOf('Los Angeles/sku01') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Los%20Angeles/sku01/"><img alt="[deal described in text]" src="/images/deal/deal01.jpg" /></a>');
	
		if ( inventory.indexOf('Los Angeles/sku02') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Los%20Angeles/sku02/"><img alt="[deal described in text]" src="/images/deal/deal02.jpg" /></a>');
	
		if ( inventory.indexOf('Los Angeles/sku03') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Los%20Angeles/sku03/"><img alt="[deal described in text]" src="/images/deal/deal03.jpg" /></a>');
	
		if ( inventory.indexOf('Los Angeles/sku04') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Los%20Angeles/sku04/"><img alt="[deal described in text]" src="/images/deal/deal04.jpg" /></a>');
	
		if ( inventory.indexOf('Los Angeles/sku05') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Los%20Angeles/sku05/"><img alt="[deal described in text]" src="/images/deal/deal05.jpg" /></a>');
	
		if ( inventory.indexOf('Los Angeles/sku06') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Los%20Angeles/sku06/"><img alt="[deal described in text]" src="/images/deal/deal06.jpg" /></a>');
	
		if ( inventory.indexOf('Los Angeles/sku07') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Los%20Angeles/sku07/"><img alt="[deal described in text]" src="/images/deal/deal07.jpg" /></a>');
	
		if ( inventory.indexOf('Los Angeles/sku08') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Los%20Angeles/sku08/"><img alt="[deal described in text]" src="/images/deal/deal08.jpg" /></a>');
	
		if ( inventory.indexOf('Los Angeles/sku09') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Los%20Angeles/sku09/"><img alt="[deal described in text]" src="/images/deal/deal09.jpg" /></a>');
	
		if ( inventory.indexOf('New York/sku01') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="New%20York/sku01/"><img alt="[deal described in text]" src="/images/deal/deal01.jpg" /></a>');
	
		if ( inventory.indexOf('New York/sku02') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="New%20York/sku02/"><img alt="[deal described in text]" src="/images/deal/deal02.jpg" /></a>');
	
		if ( inventory.indexOf('New York/sku03') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="New%20York/sku03/"><img alt="[deal described in text]" src="/images/deal/deal03.jpg" /></a>');
	
		if ( inventory.indexOf('New York/sku04') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="New%20York/sku04/"><img alt="[deal described in text]" src="/images/deal/deal04.jpg" /></a>');
	
		if ( inventory.indexOf('New York/sku05') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="New%20York/sku05/"><img alt="[deal described in text]" src="/images/deal/deal05.jpg" /></a>');
	
		if ( inventory.indexOf('New York/sku06') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="New%20York/sku06/"><img alt="[deal described in text]" src="/images/deal/deal06.jpg" /></a>');
	
		if ( inventory.indexOf('New York/sku07') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="New%20York/sku07/"><img alt="[deal described in text]" src="/images/deal/deal07.jpg" /></a>');
	
		if ( inventory.indexOf('New York/sku08') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="New%20York/sku08/"><img alt="[deal described in text]" src="/images/deal/deal08.jpg" /></a>');
	
		if ( inventory.indexOf('New York/sku09') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="New%20York/sku09/"><img alt="[deal described in text]" src="/images/deal/deal09.jpg" /></a>');
	
		if ( inventory.indexOf('Ottawa/sku01') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Ottawa/sku01/"><img alt="[deal described in text]" src="/images/deal/deal01.jpg" /></a>');
	
		if ( inventory.indexOf('Ottawa/sku02') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Ottawa/sku02/"><img alt="[deal described in text]" src="/images/deal/deal02.jpg" /></a>');
	
		if ( inventory.indexOf('Ottawa/sku03') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Ottawa/sku03/"><img alt="[deal described in text]" src="/images/deal/deal03.jpg" /></a>');
	
		if ( inventory.indexOf('Ottawa/sku04') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Ottawa/sku04/"><img alt="[deal described in text]" src="/images/deal/deal04.jpg" /></a>');
	
		if ( inventory.indexOf('Ottawa/sku05') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Ottawa/sku05/"><img alt="[deal described in text]" src="/images/deal/deal05.jpg" /></a>');
	
		if ( inventory.indexOf('Ottawa/sku06') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Ottawa/sku06/"><img alt="[deal described in text]" src="/images/deal/deal06.jpg" /></a>');
	
		if ( inventory.indexOf('Ottawa/sku07') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Ottawa/sku07/"><img alt="[deal described in text]" src="/images/deal/deal07.jpg" /></a>');
	
		if ( inventory.indexOf('Ottawa/sku08') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Ottawa/sku08/"><img alt="[deal described in text]" src="/images/deal/deal08.jpg" /></a>');
	
		if ( inventory.indexOf('Ottawa/sku09') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Ottawa/sku09/"><img alt="[deal described in text]" src="/images/deal/deal09.jpg" /></a>');
	
		if ( inventory.indexOf('Paris/sku01') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Paris/sku01/"><img alt="[deal described in text]" src="/images/deal/deal01.jpg" /></a>');
	
		if ( inventory.indexOf('Paris/sku02') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Paris/sku02/"><img alt="[deal described in text]" src="/images/deal/deal02.jpg" /></a>');
	
		if ( inventory.indexOf('Paris/sku03') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Paris/sku03/"><img alt="[deal described in text]" src="/images/deal/deal03.jpg" /></a>');
	
		if ( inventory.indexOf('Paris/sku04') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Paris/sku04/"><img alt="[deal described in text]" src="/images/deal/deal04.jpg" /></a>');
	
		if ( inventory.indexOf('Paris/sku05') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Paris/sku05/"><img alt="[deal described in text]" src="/images/deal/deal05.jpg" /></a>');
	
		if ( inventory.indexOf('Paris/sku06') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Paris/sku06/"><img alt="[deal described in text]" src="/images/deal/deal06.jpg" /></a>');
	
		if ( inventory.indexOf('Paris/sku07') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Paris/sku07/"><img alt="[deal described in text]" src="/images/deal/deal07.jpg" /></a>');
	
		if ( inventory.indexOf('Paris/sku08') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Paris/sku08/"><img alt="[deal described in text]" src="/images/deal/deal08.jpg" /></a>');
	
		if ( inventory.indexOf('Paris/sku09') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Paris/sku09/"><img alt="[deal described in text]" src="/images/deal/deal09.jpg" /></a>');
	
		if ( inventory.indexOf('Stockholm/sku01') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Stockholm/sku01/"><img alt="[deal described in text]" src="/images/deal/deal01.jpg" /></a>');
	
		if ( inventory.indexOf('Stockholm/sku02') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Stockholm/sku02/"><img alt="[deal described in text]" src="/images/deal/deal02.jpg" /></a>');
	
		if ( inventory.indexOf('Stockholm/sku03') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Stockholm/sku03/"><img alt="[deal described in text]" src="/images/deal/deal03.jpg" /></a>');
	
		if ( inventory.indexOf('Stockholm/sku04') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Stockholm/sku04/"><img alt="[deal described in text]" src="/images/deal/deal04.jpg" /></a>');
	
		if ( inventory.indexOf('Stockholm/sku05') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Stockholm/sku05/"><img alt="[deal described in text]" src="/images/deal/deal05.jpg" /></a>');
	
		if ( inventory.indexOf('Stockholm/sku06') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Stockholm/sku06/"><img alt="[deal described in text]" src="/images/deal/deal06.jpg" /></a>');
	
		if ( inventory.indexOf('Stockholm/sku07') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Stockholm/sku07/"><img alt="[deal described in text]" src="/images/deal/deal07.jpg" /></a>');
	
		if ( inventory.indexOf('Stockholm/sku08') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Stockholm/sku08/"><img alt="[deal described in text]" src="/images/deal/deal08.jpg" /></a>');
	
		if ( inventory.indexOf('Stockholm/sku09') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Stockholm/sku09/"><img alt="[deal described in text]" src="/images/deal/deal09.jpg" /></a>');
	
		if ( inventory.indexOf('Tokyo/sku01') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Tokyo/sku01/"><img alt="[deal described in text]" src="/images/deal/deal01.jpg" /></a>');
	
		if ( inventory.indexOf('Tokyo/sku02') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Tokyo/sku02/"><img alt="[deal described in text]" src="/images/deal/deal02.jpg" /></a>');
	
		if ( inventory.indexOf('Tokyo/sku03') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Tokyo/sku03/"><img alt="[deal described in text]" src="/images/deal/deal03.jpg" /></a>');
	
		if ( inventory.indexOf('Tokyo/sku04') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Tokyo/sku04/"><img alt="[deal described in text]" src="/images/deal/deal04.jpg" /></a>');
	
		if ( inventory.indexOf('Tokyo/sku05') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Tokyo/sku05/"><img alt="[deal described in text]" src="/images/deal/deal05.jpg" /></a>');
	
		if ( inventory.indexOf('Tokyo/sku06') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Tokyo/sku06/"><img alt="[deal described in text]" src="/images/deal/deal06.jpg" /></a>');
	
		if ( inventory.indexOf('Tokyo/sku07') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Tokyo/sku07/"><img alt="[deal described in text]" src="/images/deal/deal07.jpg" /></a>');
	
		if ( inventory.indexOf('Tokyo/sku08') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Tokyo/sku08/"><img alt="[deal described in text]" src="/images/deal/deal08.jpg" /></a>');
	
		if ( inventory.indexOf('Tokyo/sku09') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Tokyo/sku09/"><img alt="[deal described in text]" src="/images/deal/deal09.jpg" /></a>');
	
		if ( inventory.indexOf('Toronto/sku01') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Toronto/sku01/"><img alt="[deal described in text]" src="/images/deal/deal01.jpg" /></a>');
	
		if ( inventory.indexOf('Toronto/sku02') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Toronto/sku02/"><img alt="[deal described in text]" src="/images/deal/deal02.jpg" /></a>');
	
		if ( inventory.indexOf('Toronto/sku03') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Toronto/sku03/"><img alt="[deal described in text]" src="/images/deal/deal03.jpg" /></a>');
	
		if ( inventory.indexOf('Toronto/sku04') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Toronto/sku04/"><img alt="[deal described in text]" src="/images/deal/deal04.jpg" /></a>');
	
		if ( inventory.indexOf('Toronto/sku05') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Toronto/sku05/"><img alt="[deal described in text]" src="/images/deal/deal05.jpg" /></a>');
	
		if ( inventory.indexOf('Toronto/sku06') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Toronto/sku06/"><img alt="[deal described in text]" src="/images/deal/deal06.jpg" /></a>');
	
		if ( inventory.indexOf('Toronto/sku07') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Toronto/sku07/"><img alt="[deal described in text]" src="/images/deal/deal07.jpg" /></a>');
	
		if ( inventory.indexOf('Toronto/sku08') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Toronto/sku08/"><img alt="[deal described in text]" src="/images/deal/deal08.jpg" /></a>');
	
		if ( inventory.indexOf('Toronto/sku09') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Toronto/sku09/"><img alt="[deal described in text]" src="/images/deal/deal09.jpg" /></a>');
	
		if ( inventory.indexOf('Washington/sku01') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Washington/sku01/"><img alt="[deal described in text]" src="/images/deal/deal01.jpg" /></a>');
	
		if ( inventory.indexOf('Washington/sku02') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Washington/sku02/"><img alt="[deal described in text]" src="/images/deal/deal02.jpg" /></a>');
	
		if ( inventory.indexOf('Washington/sku03') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Washington/sku03/"><img alt="[deal described in text]" src="/images/deal/deal03.jpg" /></a>');
	
		if ( inventory.indexOf('Washington/sku04') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Washington/sku04/"><img alt="[deal described in text]" src="/images/deal/deal04.jpg" /></a>');
	
		if ( inventory.indexOf('Washington/sku05') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Washington/sku05/"><img alt="[deal described in text]" src="/images/deal/deal05.jpg" /></a>');
	
		if ( inventory.indexOf('Washington/sku06') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Washington/sku06/"><img alt="[deal described in text]" src="/images/deal/deal06.jpg" /></a>');
	
		if ( inventory.indexOf('Washington/sku07') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Washington/sku07/"><img alt="[deal described in text]" src="/images/deal/deal07.jpg" /></a>');
	
		if ( inventory.indexOf('Washington/sku08') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Washington/sku08/"><img alt="[deal described in text]" src="/images/deal/deal08.jpg" /></a>');
	
		if ( inventory.indexOf('Washington/sku09') >= 0 )
			Response.Write('<a class="deal-image-anchor" href="Washington/sku09/"><img alt="[deal described in text]" src="/images/deal/deal09.jpg" /></a>');
	
						%>
					</div>
			<!--(end SelfContained)-->
		</div><div class="SelfContained main">
			<form id="menuLoc" action="/" method="post">
				<div class="Menu toolbar">
					<label for="marketSelector" class="accessiblyHidden">Location:</label>
					<select name="market" id="marketSelector">
						<option value="">Choose Your Location!   </option>
						<option value="33.75,-84.39" <%
						if ( marketPos == '33.75,-84.39' )
						{
							Response.Write(' selected="selected"');
							marketName = 'Atlanta';
						}
						%>>Atlanta</option>
						<option value="42.04,-88.04" <%
						if ( marketPos == '42.04,-88.04' )
						{
							Response.Write(' selected="selected"');
							marketName = 'Chicago';
						}
						%>>Chicago</option>
						<option value="51.52,-0.13" <%
						if ( marketPos == '51.52,-0.13' )
						{
							Response.Write(' selected="selected"');
							marketName = 'London';
						}
						%>>London</option>
						<option value="33.92,-118.39" <%
						if ( marketPos == '33.92,-118.39' )
						{
							Response.Write(' selected="selected"');
							marketName = 'Los Angeles';
						}
						%>>Los Angeles</option>
						<option value="40.70,-74.01" <%
						if ( marketPos == '40.70,-74.01' )
						{
							Response.Write(' selected="selected"');
							marketName = 'New York';
						}
						%>>New York</option>
						<option value="45.42,-75.69" <%
						if ( marketPos == '45.42,-75.69' )
						{
							Response.Write(' selected="selected"');
							marketName = 'Ottawa';
						}
						%>>Ottawa</option>
						<option value="48.91,2.31" <%
						if ( marketPos == '48.91,2.31' )
						{
							Response.Write(' selected="selected"');
							marketName = 'Paris';
						}
						%>>Paris</option>
						<option value="59.31,18.03" <%
						if ( marketPos == '59.31,18.03' )
						{
							Response.Write(' selected="selected"');
							marketName = 'Stockholm';
						}
						%>>Stockholm</option>
						<option value="35.70,139.75" <%
						if ( marketPos == '35.70,139.75' )
						{
							Response.Write(' selected="selected"');
							marketName = 'Tokyo';
						}
						%>>Tokyo</option>
						<option value="43.66,-79.38" <%
						if ( marketPos == '43.66,-79.38' )
						{
							Response.Write(' selected="selected"');
							marketName = 'Toronto';
						}
						%>>Toronto</option>
						<option value="38.90,-77.04" <%
						if ( marketPos == '38.90,-77.04' )
						{
							Response.Write(' selected="selected"');
							marketName = 'Washington';
						}
						%>>Washington</option>
					</select>
					<input name="submit" id="marketSubmit" type="submit" value="Go" class="siteSubmit"/>
				</div>
				<!--(end Menu)-->
			</form>
		</div><!--(end SelfContained)-->
		<div class="SelfContained main market<%
			if ( ! ( marketName == '' ) )
				Response.Write(' accessiblyHidden');
			%>" id="welcome" >
			<h1>Welcome to <span style="display:block">DEALING TREE!</span></h1><p>To get started, please choose your closest market.</p>
		</div>
				
		<div class="SelfContained main market<%
				if ( ! ( marketName == 'Atlanta' ) )
					Response.Write(' accessiblyHidden');
				%>" >
			<div class="Headings">
			<h1>Great Deals in Atlanta</h1>
			<div class="SubTitle1">Buy with just one click!</div>
		</div><!--(end Headings)-->
		<%
		if ( ! ( inventory.indexOf('Atlanta/sku01') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Atlanta/sku01/">
				<img alt="[deal described in text]" src="/images/deal/deal01.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Atlanta/sku01"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="70"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Atlanta/sku01/">Cascading Style Salon and Day Spa</a>
			</h3>
			<p>
				<a href="Atlanta/sku01/">Haircut with Shampoo and Blow Dry $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Atlanta/sku02') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Atlanta/sku02/">
				<img alt="[deal described in text]" src="/images/deal/deal02.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Atlanta/sku02"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="60"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Atlanta/sku02/">Coder's Cafe</a>
			</h3>
			<p>
				<a href="Atlanta/sku02/">Half-Price Dinner $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Atlanta/sku03') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Atlanta/sku03/">
				<img alt="[deal described in text]" src="/images/deal/deal03.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Atlanta/sku03"/>
					<input type="hidden" name="price" value="60"/>
					<input type="hidden" name="value" value="120"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Atlanta/sku03/">Web Wheels Auto Palace</a>
			</h3>
			<p>
				<a href="Atlanta/sku03/">Second Day Car Rental Free $60</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Atlanta/sku04') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Atlanta/sku04/">
				<img alt="[deal described in text]" src="/images/deal/deal04.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Atlanta/sku04"/>
					<input type="hidden" name="price" value="40"/>
					<input type="hidden" name="value" value="100"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Atlanta/sku04/">Metro Area Transit Promotions</a>
			</h3>
			<p>
				<a href="Atlanta/sku04/">Save 60% on Transit Fare $40</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Atlanta/sku05') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Atlanta/sku05/">
				<img alt="[deal described in text]" src="/images/deal/deal05.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Atlanta/sku05"/>
					<input type="hidden" name="price" value="200"/>
					<input type="hidden" name="value" value="300"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Atlanta/sku05/">Stylesheets Boutique</a>
			</h3>
			<p>
				<a href="Atlanta/sku05/">Designer Fashions at a Thrify Price $200</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Atlanta/sku06') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Atlanta/sku06/">
				<img alt="[deal described in text]" src="/images/deal/deal06.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Atlanta/sku06"/>
					<input type="hidden" name="price" value="70"/>
					<input type="hidden" name="value" value="150"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Atlanta/sku06/">WebSockets WebHosting</a>
			</h3>
			<p>
				<a href="Atlanta/sku06/">One Year of Web Hosting @ the Six Month Price $70</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Atlanta/sku07') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Atlanta/sku07/">
				<img alt="[deal described in text]" src="/images/deal/deal07.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Atlanta/sku07"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="50"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Atlanta/sku07/">Save the Planet</a>
			</h3>
			<p>
				<a href="Atlanta/sku07/">Recycled Products, Reduced Prices! $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Atlanta/sku08') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Atlanta/sku08/">
				<img alt="[deal described in text]" src="/images/deal/deal08.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Atlanta/sku08"/>
					<input type="hidden" name="price" value="300"/>
					<input type="hidden" name="value" value="500"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Atlanta/sku08/">Web Workers Workouts</a>
			</h3>
			<p>
				<a href="Atlanta/sku08/">Two Year Gym Membership $300</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Atlanta/sku09') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Atlanta/sku09/">
				<img alt="[deal described in text]" src="/images/deal/deal09.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Atlanta/sku09"/>
					<input type="hidden" name="price" value="150"/>
					<input type="hidden" name="value" value="300"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Atlanta/sku09/">Hypertext Hotel</a>
			</h3>
			<p>
				<a href="Atlanta/sku09/">Second Night On Us! $150</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	<div style="clear:left;font-size:1px;"> </div>
		</div>
	  
		<div class="SelfContained main market<%
				if ( ! ( marketName == 'Chicago' ) )
					Response.Write(' accessiblyHidden');
				%>" >
			<div class="Headings">
			<h1>Great Deals in Chicago</h1>
			<div class="SubTitle1">Buy with just one click!</div>
		</div><!--(end Headings)-->
		<%
		if ( ! ( inventory.indexOf('Chicago/sku01') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Chicago/sku01/">
				<img alt="[deal described in text]" src="/images/deal/deal01.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Chicago/sku01"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="70"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Chicago/sku01/">Cascading Style Salon and Day Spa</a>
			</h3>
			<p>
				<a href="Chicago/sku01/">Haircut with Shampoo and Blow Dry $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Chicago/sku02') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Chicago/sku02/">
				<img alt="[deal described in text]" src="/images/deal/deal02.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Chicago/sku02"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="60"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Chicago/sku02/">Coder's Cafe</a>
			</h3>
			<p>
				<a href="Chicago/sku02/">Half-Price Dinner $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Chicago/sku03') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Chicago/sku03/">
				<img alt="[deal described in text]" src="/images/deal/deal03.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Chicago/sku03"/>
					<input type="hidden" name="price" value="60"/>
					<input type="hidden" name="value" value="120"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Chicago/sku03/">Web Wheels Auto Palace</a>
			</h3>
			<p>
				<a href="Chicago/sku03/">Second Day Car Rental Free $60</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Chicago/sku04') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Chicago/sku04/">
				<img alt="[deal described in text]" src="/images/deal/deal04.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Chicago/sku04"/>
					<input type="hidden" name="price" value="40"/>
					<input type="hidden" name="value" value="100"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Chicago/sku04/">Metro Area Transit Promotions</a>
			</h3>
			<p>
				<a href="Chicago/sku04/">Save 60% on Transit Fare $40</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Chicago/sku05') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Chicago/sku05/">
				<img alt="[deal described in text]" src="/images/deal/deal05.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Chicago/sku05"/>
					<input type="hidden" name="price" value="200"/>
					<input type="hidden" name="value" value="300"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Chicago/sku05/">Stylesheets Boutique</a>
			</h3>
			<p>
				<a href="Chicago/sku05/">Designer Fashions at a Thrify Price $200</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Chicago/sku06') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Chicago/sku06/">
				<img alt="[deal described in text]" src="/images/deal/deal06.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Chicago/sku06"/>
					<input type="hidden" name="price" value="70"/>
					<input type="hidden" name="value" value="150"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Chicago/sku06/">WebSockets WebHosting</a>
			</h3>
			<p>
				<a href="Chicago/sku06/">One Year of Web Hosting @ the Six Month Price $70</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Chicago/sku07') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Chicago/sku07/">
				<img alt="[deal described in text]" src="/images/deal/deal07.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Chicago/sku07"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="50"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Chicago/sku07/">Save the Planet</a>
			</h3>
			<p>
				<a href="Chicago/sku07/">Recycled Products, Reduced Prices! $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Chicago/sku08') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Chicago/sku08/">
				<img alt="[deal described in text]" src="/images/deal/deal08.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Chicago/sku08"/>
					<input type="hidden" name="price" value="300"/>
					<input type="hidden" name="value" value="500"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Chicago/sku08/">Web Workers Workouts</a>
			</h3>
			<p>
				<a href="Chicago/sku08/">Two Year Gym Membership $300</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Chicago/sku09') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Chicago/sku09/">
				<img alt="[deal described in text]" src="/images/deal/deal09.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Chicago/sku09"/>
					<input type="hidden" name="price" value="150"/>
					<input type="hidden" name="value" value="300"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Chicago/sku09/">Hypertext Hotel</a>
			</h3>
			<p>
				<a href="Chicago/sku09/">Second Night On Us! $150</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	<div style="clear:left;font-size:1px;"> </div>
		</div>
	  
		<div class="SelfContained main market<%
				if ( ! ( marketName == 'London' ) )
					Response.Write(' accessiblyHidden');
				%>" >
			<div class="Headings">
			<h1>Great Deals in London</h1>
			<div class="SubTitle1">Buy with just one click!</div>
		</div><!--(end Headings)-->
		<%
		if ( ! ( inventory.indexOf('London/sku01') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="London/sku01/">
				<img alt="[deal described in text]" src="/images/deal/deal01.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="London/sku01"/>
					<input type="hidden" name="price" value="20"/>
					<input type="hidden" name="value" value="40"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="London/sku01/">Cascading Style Salon and Day Spa</a>
			</h3>
			<p>
				<a href="London/sku01/">Haircut with Shampoo and Blow Dry £20</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('London/sku02') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="London/sku02/">
				<img alt="[deal described in text]" src="/images/deal/deal02.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="London/sku02"/>
					<input type="hidden" name="price" value="10"/>
					<input type="hidden" name="value" value="30"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="London/sku02/">Coder's Cafe</a>
			</h3>
			<p>
				<a href="London/sku02/">Half-Price Dinner £10</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('London/sku03') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="London/sku03/">
				<img alt="[deal described in text]" src="/images/deal/deal03.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="London/sku03"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="70"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="London/sku03/">Web Wheels Auto Palace</a>
			</h3>
			<p>
				<a href="London/sku03/">Second Day Car Rental Free £30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('London/sku04') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="London/sku04/">
				<img alt="[deal described in text]" src="/images/deal/deal04.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="London/sku04"/>
					<input type="hidden" name="price" value="20"/>
					<input type="hidden" name="value" value="60"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="London/sku04/">Metro Area Transit Promotions</a>
			</h3>
			<p>
				<a href="London/sku04/">Save 60% on Transit Fare £20</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('London/sku05') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="London/sku05/">
				<img alt="[deal described in text]" src="/images/deal/deal05.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="London/sku05"/>
					<input type="hidden" name="price" value="120"/>
					<input type="hidden" name="value" value="180"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="London/sku05/">Stylesheets Boutique</a>
			</h3>
			<p>
				<a href="London/sku05/">Designer Fashions at a Thrify Price £120</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('London/sku06') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="London/sku06/">
				<img alt="[deal described in text]" src="/images/deal/deal06.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="London/sku06"/>
					<input type="hidden" name="price" value="40"/>
					<input type="hidden" name="value" value="90"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="London/sku06/">WebSockets WebHosting</a>
			</h3>
			<p>
				<a href="London/sku06/">One Year of Web Hosting @ the Six Month Price £40</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('London/sku07') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="London/sku07/">
				<img alt="[deal described in text]" src="/images/deal/deal07.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="London/sku07"/>
					<input type="hidden" name="price" value="20"/>
					<input type="hidden" name="value" value="30"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="London/sku07/">Save the Planet</a>
			</h3>
			<p>
				<a href="London/sku07/">Recycled Products, Reduced Prices! £20</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('London/sku08') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="London/sku08/">
				<img alt="[deal described in text]" src="/images/deal/deal08.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="London/sku08"/>
					<input type="hidden" name="price" value="180"/>
					<input type="hidden" name="value" value="310"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="London/sku08/">Web Workers Workouts</a>
			</h3>
			<p>
				<a href="London/sku08/">Two Year Gym Membership £180</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('London/sku09') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="London/sku09/">
				<img alt="[deal described in text]" src="/images/deal/deal09.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="London/sku09"/>
					<input type="hidden" name="price" value="90"/>
					<input type="hidden" name="value" value="180"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="London/sku09/">Hypertext Hotel</a>
			</h3>
			<p>
				<a href="London/sku09/">Second Night On Us! £90</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	<div style="clear:left;font-size:1px;"> </div>
		</div>
	  
		<div class="SelfContained main market<%
				if ( ! ( marketName == 'Los Angeles' ) )
					Response.Write(' accessiblyHidden');
				%>" >
			<div class="Headings">
			<h1>Great Deals in Los Angeles</h1>
			<div class="SubTitle1">Buy with just one click!</div>
		</div><!--(end Headings)-->
		<%
		if ( ! ( inventory.indexOf('Los Angeles/sku01') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Los%20Angeles/sku01/">
				<img alt="[deal described in text]" src="/images/deal/deal01.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Los Angeles/sku01"/>
					<input type="hidden" name="price" value="40"/>
					<input type="hidden" name="value" value="80"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Los%20Angeles/sku01/">Cascading Style Salon and Day Spa</a>
			</h3>
			<p>
				<a href="Los%20Angeles/sku01/">Haircut with Shampoo and Blow Dry $40</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Los Angeles/sku02') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Los%20Angeles/sku02/">
				<img alt="[deal described in text]" src="/images/deal/deal02.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Los Angeles/sku02"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="70"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Los%20Angeles/sku02/">Coder's Cafe</a>
			</h3>
			<p>
				<a href="Los%20Angeles/sku02/">Half-Price Dinner $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Los Angeles/sku03') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Los%20Angeles/sku03/">
				<img alt="[deal described in text]" src="/images/deal/deal03.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Los Angeles/sku03"/>
					<input type="hidden" name="price" value="70"/>
					<input type="hidden" name="value" value="140"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Los%20Angeles/sku03/">Web Wheels Auto Palace</a>
			</h3>
			<p>
				<a href="Los%20Angeles/sku03/">Second Day Car Rental Free $70</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Los Angeles/sku04') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Los%20Angeles/sku04/">
				<img alt="[deal described in text]" src="/images/deal/deal04.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Los Angeles/sku04"/>
					<input type="hidden" name="price" value="40"/>
					<input type="hidden" name="value" value="120"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Los%20Angeles/sku04/">Metro Area Transit Promotions</a>
			</h3>
			<p>
				<a href="Los%20Angeles/sku04/">Save 60% on Transit Fare $40</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Los Angeles/sku05') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Los%20Angeles/sku05/">
				<img alt="[deal described in text]" src="/images/deal/deal05.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Los Angeles/sku05"/>
					<input type="hidden" name="price" value="240"/>
					<input type="hidden" name="value" value="360"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Los%20Angeles/sku05/">Stylesheets Boutique</a>
			</h3>
			<p>
				<a href="Los%20Angeles/sku05/">Designer Fashions at a Thrify Price $240</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Los Angeles/sku06') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Los%20Angeles/sku06/">
				<img alt="[deal described in text]" src="/images/deal/deal06.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Los Angeles/sku06"/>
					<input type="hidden" name="price" value="90"/>
					<input type="hidden" name="value" value="180"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Los%20Angeles/sku06/">WebSockets WebHosting</a>
			</h3>
			<p>
				<a href="Los%20Angeles/sku06/">One Year of Web Hosting @ the Six Month Price $90</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Los Angeles/sku07') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Los%20Angeles/sku07/">
				<img alt="[deal described in text]" src="/images/deal/deal07.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Los Angeles/sku07"/>
					<input type="hidden" name="price" value="40"/>
					<input type="hidden" name="value" value="60"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Los%20Angeles/sku07/">Save the Planet</a>
			</h3>
			<p>
				<a href="Los%20Angeles/sku07/">Recycled Products, Reduced Prices! $40</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Los Angeles/sku08') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Los%20Angeles/sku08/">
				<img alt="[deal described in text]" src="/images/deal/deal08.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Los Angeles/sku08"/>
					<input type="hidden" name="price" value="360"/>
					<input type="hidden" name="value" value="600"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Los%20Angeles/sku08/">Web Workers Workouts</a>
			</h3>
			<p>
				<a href="Los%20Angeles/sku08/">Two Year Gym Membership $360</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Los Angeles/sku09') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Los%20Angeles/sku09/">
				<img alt="[deal described in text]" src="/images/deal/deal09.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Los Angeles/sku09"/>
					<input type="hidden" name="price" value="180"/>
					<input type="hidden" name="value" value="360"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Los%20Angeles/sku09/">Hypertext Hotel</a>
			</h3>
			<p>
				<a href="Los%20Angeles/sku09/">Second Night On Us! $180</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	<div style="clear:left;font-size:1px;"> </div>
		</div>
	  
		<div class="SelfContained main market<%
				if ( ! ( marketName == 'New York' ) )
					Response.Write(' accessiblyHidden');
				%>" >
			<div class="Headings">
			<h1>Great Deals in New York</h1>
			<div class="SubTitle1">Buy with just one click!</div>
		</div><!--(end Headings)-->
		<%
		if ( ! ( inventory.indexOf('New York/sku01') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="New%20York/sku01/">
				<img alt="[deal described in text]" src="/images/deal/deal01.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="New York/sku01"/>
					<input type="hidden" name="price" value="50"/>
					<input type="hidden" name="value" value="100"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="New%20York/sku01/">Cascading Style Salon and Day Spa</a>
			</h3>
			<p>
				<a href="New%20York/sku01/">Haircut with Shampoo and Blow Dry $50</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('New York/sku02') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="New%20York/sku02/">
				<img alt="[deal described in text]" src="/images/deal/deal02.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="New York/sku02"/>
					<input type="hidden" name="price" value="40"/>
					<input type="hidden" name="value" value="90"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="New%20York/sku02/">Coder's Cafe</a>
			</h3>
			<p>
				<a href="New%20York/sku02/">Half-Price Dinner $40</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('New York/sku03') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="New%20York/sku03/">
				<img alt="[deal described in text]" src="/images/deal/deal03.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="New York/sku03"/>
					<input type="hidden" name="price" value="90"/>
					<input type="hidden" name="value" value="180"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="New%20York/sku03/">Web Wheels Auto Palace</a>
			</h3>
			<p>
				<a href="New%20York/sku03/">Second Day Car Rental Free $90</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('New York/sku04') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="New%20York/sku04/">
				<img alt="[deal described in text]" src="/images/deal/deal04.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="New York/sku04"/>
					<input type="hidden" name="price" value="60"/>
					<input type="hidden" name="value" value="150"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="New%20York/sku04/">Metro Area Transit Promotions</a>
			</h3>
			<p>
				<a href="New%20York/sku04/">Save 60% on Transit Fare $60</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('New York/sku05') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="New%20York/sku05/">
				<img alt="[deal described in text]" src="/images/deal/deal05.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="New York/sku05"/>
					<input type="hidden" name="price" value="300"/>
					<input type="hidden" name="value" value="450"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="New%20York/sku05/">Stylesheets Boutique</a>
			</h3>
			<p>
				<a href="New%20York/sku05/">Designer Fashions at a Thrify Price $300</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('New York/sku06') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="New%20York/sku06/">
				<img alt="[deal described in text]" src="/images/deal/deal06.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="New York/sku06"/>
					<input type="hidden" name="price" value="110"/>
					<input type="hidden" name="value" value="220"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="New%20York/sku06/">WebSockets WebHosting</a>
			</h3>
			<p>
				<a href="New%20York/sku06/">One Year of Web Hosting @ the Six Month Price $110</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('New York/sku07') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="New%20York/sku07/">
				<img alt="[deal described in text]" src="/images/deal/deal07.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="New York/sku07"/>
					<input type="hidden" name="price" value="50"/>
					<input type="hidden" name="value" value="70"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="New%20York/sku07/">Save the Planet</a>
			</h3>
			<p>
				<a href="New%20York/sku07/">Recycled Products, Reduced Prices! $50</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('New York/sku08') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="New%20York/sku08/">
				<img alt="[deal described in text]" src="/images/deal/deal08.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="New York/sku08"/>
					<input type="hidden" name="price" value="450"/>
					<input type="hidden" name="value" value="750"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="New%20York/sku08/">Web Workers Workouts</a>
			</h3>
			<p>
				<a href="New%20York/sku08/">Two Year Gym Membership $450</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('New York/sku09') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="New%20York/sku09/">
				<img alt="[deal described in text]" src="/images/deal/deal09.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="New York/sku09"/>
					<input type="hidden" name="price" value="220"/>
					<input type="hidden" name="value" value="450"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="New%20York/sku09/">Hypertext Hotel</a>
			</h3>
			<p>
				<a href="New%20York/sku09/">Second Night On Us! $220</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	<div style="clear:left;font-size:1px;"> </div>
		</div>
	  
		<div class="SelfContained main market<%
				if ( ! ( marketName == 'Ottawa' ) )
					Response.Write(' accessiblyHidden');
				%>" >
			<div class="Headings">
			<h1>Great Deals in Ottawa</h1>
			<div class="SubTitle1">Buy with just one click!</div>
		</div><!--(end Headings)-->
		<%
		if ( ! ( inventory.indexOf('Ottawa/sku01') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Ottawa/sku01/">
				<img alt="[deal described in text]" src="/images/deal/deal01.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Ottawa/sku01"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="70"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Ottawa/sku01/">Cascading Style Salon and Day Spa</a>
			</h3>
			<p>
				<a href="Ottawa/sku01/">Haircut with Shampoo and Blow Dry $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Ottawa/sku02') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Ottawa/sku02/">
				<img alt="[deal described in text]" src="/images/deal/deal02.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Ottawa/sku02"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="60"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Ottawa/sku02/">Coder's Cafe</a>
			</h3>
			<p>
				<a href="Ottawa/sku02/">Half-Price Dinner $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Ottawa/sku03') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Ottawa/sku03/">
				<img alt="[deal described in text]" src="/images/deal/deal03.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Ottawa/sku03"/>
					<input type="hidden" name="price" value="60"/>
					<input type="hidden" name="value" value="120"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Ottawa/sku03/">Web Wheels Auto Palace</a>
			</h3>
			<p>
				<a href="Ottawa/sku03/">Second Day Car Rental Free $60</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Ottawa/sku04') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Ottawa/sku04/">
				<img alt="[deal described in text]" src="/images/deal/deal04.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Ottawa/sku04"/>
					<input type="hidden" name="price" value="40"/>
					<input type="hidden" name="value" value="100"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Ottawa/sku04/">Metro Area Transit Promotions</a>
			</h3>
			<p>
				<a href="Ottawa/sku04/">Save 60% on Transit Fare $40</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Ottawa/sku05') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Ottawa/sku05/">
				<img alt="[deal described in text]" src="/images/deal/deal05.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Ottawa/sku05"/>
					<input type="hidden" name="price" value="200"/>
					<input type="hidden" name="value" value="300"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Ottawa/sku05/">Stylesheets Boutique</a>
			</h3>
			<p>
				<a href="Ottawa/sku05/">Designer Fashions at a Thrify Price $200</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Ottawa/sku06') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Ottawa/sku06/">
				<img alt="[deal described in text]" src="/images/deal/deal06.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Ottawa/sku06"/>
					<input type="hidden" name="price" value="70"/>
					<input type="hidden" name="value" value="150"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Ottawa/sku06/">WebSockets WebHosting</a>
			</h3>
			<p>
				<a href="Ottawa/sku06/">One Year of Web Hosting @ the Six Month Price $70</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Ottawa/sku07') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Ottawa/sku07/">
				<img alt="[deal described in text]" src="/images/deal/deal07.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Ottawa/sku07"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="50"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Ottawa/sku07/">Save the Planet</a>
			</h3>
			<p>
				<a href="Ottawa/sku07/">Recycled Products, Reduced Prices! $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Ottawa/sku08') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Ottawa/sku08/">
				<img alt="[deal described in text]" src="/images/deal/deal08.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Ottawa/sku08"/>
					<input type="hidden" name="price" value="300"/>
					<input type="hidden" name="value" value="510"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Ottawa/sku08/">Web Workers Workouts</a>
			</h3>
			<p>
				<a href="Ottawa/sku08/">Two Year Gym Membership $300</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Ottawa/sku09') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Ottawa/sku09/">
				<img alt="[deal described in text]" src="/images/deal/deal09.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Ottawa/sku09"/>
					<input type="hidden" name="price" value="150"/>
					<input type="hidden" name="value" value="300"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Ottawa/sku09/">Hypertext Hotel</a>
			</h3>
			<p>
				<a href="Ottawa/sku09/">Second Night On Us! $150</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	<div style="clear:left;font-size:1px;"> </div>
		</div>
	  
		<div class="SelfContained main market<%
				if ( ! ( marketName == 'Paris' ) )
					Response.Write(' accessiblyHidden');
				%>" >
			<div class="Headings">
			<h1>Great Deals in Paris</h1>
			<div class="SubTitle1">Buy with just one click!</div>
		</div><!--(end Headings)-->
		<%
		if ( ! ( inventory.indexOf('Paris/sku01') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Paris/sku01/">
				<img alt="[deal described in text]" src="/images/deal/deal01.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Paris/sku01"/>
					<input type="hidden" name="price" value="20"/>
					<input type="hidden" name="value" value="50"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Paris/sku01/">Cascading Style Salon and Day Spa</a>
			</h3>
			<p>
				<a href="Paris/sku01/">Haircut with Shampoo and Blow Dry €20</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Paris/sku02') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Paris/sku02/">
				<img alt="[deal described in text]" src="/images/deal/deal02.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Paris/sku02"/>
					<input type="hidden" name="price" value="20"/>
					<input type="hidden" name="value" value="40"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Paris/sku02/">Coder's Cafe</a>
			</h3>
			<p>
				<a href="Paris/sku02/">Half-Price Dinner €20</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Paris/sku03') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Paris/sku03/">
				<img alt="[deal described in text]" src="/images/deal/deal03.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Paris/sku03"/>
					<input type="hidden" name="price" value="40"/>
					<input type="hidden" name="value" value="80"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Paris/sku03/">Web Wheels Auto Palace</a>
			</h3>
			<p>
				<a href="Paris/sku03/">Second Day Car Rental Free €40</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Paris/sku04') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Paris/sku04/">
				<img alt="[deal described in text]" src="/images/deal/deal04.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Paris/sku04"/>
					<input type="hidden" name="price" value="20"/>
					<input type="hidden" name="value" value="70"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Paris/sku04/">Metro Area Transit Promotions</a>
			</h3>
			<p>
				<a href="Paris/sku04/">Save 60% on Transit Fare €20</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Paris/sku05') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Paris/sku05/">
				<img alt="[deal described in text]" src="/images/deal/deal05.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Paris/sku05"/>
					<input type="hidden" name="price" value="140"/>
					<input type="hidden" name="value" value="210"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Paris/sku05/">Stylesheets Boutique</a>
			</h3>
			<p>
				<a href="Paris/sku05/">Designer Fashions at a Thrify Price €140</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Paris/sku06') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Paris/sku06/">
				<img alt="[deal described in text]" src="/images/deal/deal06.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Paris/sku06"/>
					<input type="hidden" name="price" value="50"/>
					<input type="hidden" name="value" value="100"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Paris/sku06/">WebSockets WebHosting</a>
			</h3>
			<p>
				<a href="Paris/sku06/">One Year of Web Hosting @ the Six Month Price €50</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Paris/sku07') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Paris/sku07/">
				<img alt="[deal described in text]" src="/images/deal/deal07.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Paris/sku07"/>
					<input type="hidden" name="price" value="20"/>
					<input type="hidden" name="value" value="30"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Paris/sku07/">Save the Planet</a>
			</h3>
			<p>
				<a href="Paris/sku07/">Recycled Products, Reduced Prices! €20</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Paris/sku08') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Paris/sku08/">
				<img alt="[deal described in text]" src="/images/deal/deal08.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Paris/sku08"/>
					<input type="hidden" name="price" value="210"/>
					<input type="hidden" name="value" value="360"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Paris/sku08/">Web Workers Workouts</a>
			</h3>
			<p>
				<a href="Paris/sku08/">Two Year Gym Membership €210</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Paris/sku09') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Paris/sku09/">
				<img alt="[deal described in text]" src="/images/deal/deal09.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Paris/sku09"/>
					<input type="hidden" name="price" value="100"/>
					<input type="hidden" name="value" value="210"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Paris/sku09/">Hypertext Hotel</a>
			</h3>
			<p>
				<a href="Paris/sku09/">Second Night On Us! €100</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	<div style="clear:left;font-size:1px;"> </div>
		</div>
	  
		<div class="SelfContained main market<%
				if ( ! ( marketName == 'Stockholm' ) )
					Response.Write(' accessiblyHidden');
				%>" >
			<div class="Headings">
			<h1>Great Deals in Stockholm</h1>
			<div class="SubTitle1">Buy with just one click!</div>
		</div><!--(end Headings)-->
		<%
		if ( ! ( inventory.indexOf('Stockholm/sku01') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Stockholm/sku01/">
				<img alt="[deal described in text]" src="/images/deal/deal01.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Stockholm/sku01"/>
					<input type="hidden" name="price" value="230"/>
					<input type="hidden" name="value" value="460"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Stockholm/sku01/">Cascading Style Salon and Day Spa</a>
			</h3>
			<p>
				<a href="Stockholm/sku01/">Haircut with Shampoo and Blow Dry kr230</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Stockholm/sku02') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Stockholm/sku02/">
				<img alt="[deal described in text]" src="/images/deal/deal02.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Stockholm/sku02"/>
					<input type="hidden" name="price" value="190"/>
					<input type="hidden" name="value" value="390"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Stockholm/sku02/">Coder's Cafe</a>
			</h3>
			<p>
				<a href="Stockholm/sku02/">Half-Price Dinner kr190</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Stockholm/sku03') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Stockholm/sku03/">
				<img alt="[deal described in text]" src="/images/deal/deal03.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Stockholm/sku03"/>
					<input type="hidden" name="price" value="390"/>
					<input type="hidden" name="value" value="790"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Stockholm/sku03/">Web Wheels Auto Palace</a>
			</h3>
			<p>
				<a href="Stockholm/sku03/">Second Day Car Rental Free kr390</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Stockholm/sku04') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Stockholm/sku04/">
				<img alt="[deal described in text]" src="/images/deal/deal04.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Stockholm/sku04"/>
					<input type="hidden" name="price" value="260"/>
					<input type="hidden" name="value" value="660"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Stockholm/sku04/">Metro Area Transit Promotions</a>
			</h3>
			<p>
				<a href="Stockholm/sku04/">Save 60% on Transit Fare kr260</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Stockholm/sku05') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Stockholm/sku05/">
				<img alt="[deal described in text]" src="/images/deal/deal05.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Stockholm/sku05"/>
					<input type="hidden" name="price" value="1320"/>
					<input type="hidden" name="value" value="1980"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Stockholm/sku05/">Stylesheets Boutique</a>
			</h3>
			<p>
				<a href="Stockholm/sku05/">Designer Fashions at a Thrify Price kr1320</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Stockholm/sku06') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Stockholm/sku06/">
				<img alt="[deal described in text]" src="/images/deal/deal06.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Stockholm/sku06"/>
					<input type="hidden" name="price" value="490"/>
					<input type="hidden" name="value" value="990"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Stockholm/sku06/">WebSockets WebHosting</a>
			</h3>
			<p>
				<a href="Stockholm/sku06/">One Year of Web Hosting @ the Six Month Price kr490</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Stockholm/sku07') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Stockholm/sku07/">
				<img alt="[deal described in text]" src="/images/deal/deal07.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Stockholm/sku07"/>
					<input type="hidden" name="price" value="230"/>
					<input type="hidden" name="value" value="330"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Stockholm/sku07/">Save the Planet</a>
			</h3>
			<p>
				<a href="Stockholm/sku07/">Recycled Products, Reduced Prices! kr230</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Stockholm/sku08') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Stockholm/sku08/">
				<img alt="[deal described in text]" src="/images/deal/deal08.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Stockholm/sku08"/>
					<input type="hidden" name="price" value="1980"/>
					<input type="hidden" name="value" value="3300"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Stockholm/sku08/">Web Workers Workouts</a>
			</h3>
			<p>
				<a href="Stockholm/sku08/">Two Year Gym Membership kr1980</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Stockholm/sku09') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Stockholm/sku09/">
				<img alt="[deal described in text]" src="/images/deal/deal09.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Stockholm/sku09"/>
					<input type="hidden" name="price" value="990"/>
					<input type="hidden" name="value" value="1980"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Stockholm/sku09/">Hypertext Hotel</a>
			</h3>
			<p>
				<a href="Stockholm/sku09/">Second Night On Us! kr990</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	<div style="clear:left;font-size:1px;"> </div>
		</div>
	  
		<div class="SelfContained main market<%
				if ( ! ( marketName == 'Tokyo' ) )
					Response.Write(' accessiblyHidden');
				%>" >
			<div class="Headings">
			<h1>Great Deals in Tokyo</h1>
			<div class="SubTitle1">Buy with just one click!</div>
		</div><!--(end Headings)-->
		<%
		if ( ! ( inventory.indexOf('Tokyo/sku01') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Tokyo/sku01/">
				<img alt="[deal described in text]" src="/images/deal/deal01.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Tokyo/sku01"/>
					<input type="hidden" name="price" value="2680"/>
					<input type="hidden" name="value" value="5370"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Tokyo/sku01/">Cascading Style Salon and Day Spa</a>
			</h3>
			<p>
				<a href="Tokyo/sku01/">Haircut with Shampoo and Blow Dry ¥2680</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Tokyo/sku02') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Tokyo/sku02/">
				<img alt="[deal described in text]" src="/images/deal/deal02.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Tokyo/sku02"/>
					<input type="hidden" name="price" value="2300"/>
					<input type="hidden" name="value" value="4600"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Tokyo/sku02/">Coder's Cafe</a>
			</h3>
			<p>
				<a href="Tokyo/sku02/">Half-Price Dinner ¥2300</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Tokyo/sku03') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Tokyo/sku03/">
				<img alt="[deal described in text]" src="/images/deal/deal03.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Tokyo/sku03"/>
					<input type="hidden" name="price" value="4600"/>
					<input type="hidden" name="value" value="9210"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Tokyo/sku03/">Web Wheels Auto Palace</a>
			</h3>
			<p>
				<a href="Tokyo/sku03/">Second Day Car Rental Free ¥4600</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Tokyo/sku04') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Tokyo/sku04/">
				<img alt="[deal described in text]" src="/images/deal/deal04.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Tokyo/sku04"/>
					<input type="hidden" name="price" value="3070"/>
					<input type="hidden" name="value" value="7680"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Tokyo/sku04/">Metro Area Transit Promotions</a>
			</h3>
			<p>
				<a href="Tokyo/sku04/">Save 60% on Transit Fare ¥3070</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Tokyo/sku05') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Tokyo/sku05/">
				<img alt="[deal described in text]" src="/images/deal/deal05.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Tokyo/sku05"/>
					<input type="hidden" name="price" value="15360"/>
					<input type="hidden" name="value" value="23040"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Tokyo/sku05/">Stylesheets Boutique</a>
			</h3>
			<p>
				<a href="Tokyo/sku05/">Designer Fashions at a Thrify Price ¥15360</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Tokyo/sku06') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Tokyo/sku06/">
				<img alt="[deal described in text]" src="/images/deal/deal06.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Tokyo/sku06"/>
					<input type="hidden" name="price" value="5760"/>
					<input type="hidden" name="value" value="11520"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Tokyo/sku06/">WebSockets WebHosting</a>
			</h3>
			<p>
				<a href="Tokyo/sku06/">One Year of Web Hosting @ the Six Month Price ¥5760</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Tokyo/sku07') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Tokyo/sku07/">
				<img alt="[deal described in text]" src="/images/deal/deal07.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Tokyo/sku07"/>
					<input type="hidden" name="price" value="2680"/>
					<input type="hidden" name="value" value="3840"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Tokyo/sku07/">Save the Planet</a>
			</h3>
			<p>
				<a href="Tokyo/sku07/">Recycled Products, Reduced Prices! ¥2680</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Tokyo/sku08') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Tokyo/sku08/">
				<img alt="[deal described in text]" src="/images/deal/deal08.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Tokyo/sku08"/>
					<input type="hidden" name="price" value="23040"/>
					<input type="hidden" name="value" value="38400"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Tokyo/sku08/">Web Workers Workouts</a>
			</h3>
			<p>
				<a href="Tokyo/sku08/">Two Year Gym Membership ¥23040</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Tokyo/sku09') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Tokyo/sku09/">
				<img alt="[deal described in text]" src="/images/deal/deal09.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Tokyo/sku09"/>
					<input type="hidden" name="price" value="11520"/>
					<input type="hidden" name="value" value="23040"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Tokyo/sku09/">Hypertext Hotel</a>
			</h3>
			<p>
				<a href="Tokyo/sku09/">Second Night On Us! ¥11520</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	<div style="clear:left;font-size:1px;"> </div>
		</div>
	  
		<div class="SelfContained main market<%
				if ( ! ( marketName == 'Toronto' ) )
					Response.Write(' accessiblyHidden');
				%>" >
			<div class="Headings">
			<h1>Great Deals in Toronto</h1>
			<div class="SubTitle1">Buy with just one click!</div>
		</div><!--(end Headings)-->
		<%
		if ( ! ( inventory.indexOf('Toronto/sku01') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Toronto/sku01/">
				<img alt="[deal described in text]" src="/images/deal/deal01.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Toronto/sku01"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="70"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Toronto/sku01/">Cascading Style Salon and Day Spa</a>
			</h3>
			<p>
				<a href="Toronto/sku01/">Haircut with Shampoo and Blow Dry $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Toronto/sku02') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Toronto/sku02/">
				<img alt="[deal described in text]" src="/images/deal/deal02.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Toronto/sku02"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="60"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Toronto/sku02/">Coder's Cafe</a>
			</h3>
			<p>
				<a href="Toronto/sku02/">Half-Price Dinner $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Toronto/sku03') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Toronto/sku03/">
				<img alt="[deal described in text]" src="/images/deal/deal03.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Toronto/sku03"/>
					<input type="hidden" name="price" value="60"/>
					<input type="hidden" name="value" value="120"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Toronto/sku03/">Web Wheels Auto Palace</a>
			</h3>
			<p>
				<a href="Toronto/sku03/">Second Day Car Rental Free $60</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Toronto/sku04') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Toronto/sku04/">
				<img alt="[deal described in text]" src="/images/deal/deal04.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Toronto/sku04"/>
					<input type="hidden" name="price" value="40"/>
					<input type="hidden" name="value" value="100"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Toronto/sku04/">Metro Area Transit Promotions</a>
			</h3>
			<p>
				<a href="Toronto/sku04/">Save 60% on Transit Fare $40</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Toronto/sku05') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Toronto/sku05/">
				<img alt="[deal described in text]" src="/images/deal/deal05.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Toronto/sku05"/>
					<input type="hidden" name="price" value="200"/>
					<input type="hidden" name="value" value="300"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Toronto/sku05/">Stylesheets Boutique</a>
			</h3>
			<p>
				<a href="Toronto/sku05/">Designer Fashions at a Thrify Price $200</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Toronto/sku06') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Toronto/sku06/">
				<img alt="[deal described in text]" src="/images/deal/deal06.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Toronto/sku06"/>
					<input type="hidden" name="price" value="70"/>
					<input type="hidden" name="value" value="150"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Toronto/sku06/">WebSockets WebHosting</a>
			</h3>
			<p>
				<a href="Toronto/sku06/">One Year of Web Hosting @ the Six Month Price $70</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Toronto/sku07') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Toronto/sku07/">
				<img alt="[deal described in text]" src="/images/deal/deal07.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Toronto/sku07"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="50"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Toronto/sku07/">Save the Planet</a>
			</h3>
			<p>
				<a href="Toronto/sku07/">Recycled Products, Reduced Prices! $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Toronto/sku08') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Toronto/sku08/">
				<img alt="[deal described in text]" src="/images/deal/deal08.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Toronto/sku08"/>
					<input type="hidden" name="price" value="300"/>
					<input type="hidden" name="value" value="510"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Toronto/sku08/">Web Workers Workouts</a>
			</h3>
			<p>
				<a href="Toronto/sku08/">Two Year Gym Membership $300</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Toronto/sku09') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Toronto/sku09/">
				<img alt="[deal described in text]" src="/images/deal/deal09.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Toronto/sku09"/>
					<input type="hidden" name="price" value="150"/>
					<input type="hidden" name="value" value="300"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Toronto/sku09/">Hypertext Hotel</a>
			</h3>
			<p>
				<a href="Toronto/sku09/">Second Night On Us! $150</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	<div style="clear:left;font-size:1px;"> </div>
		</div>
	  
		<div class="SelfContained main market<%
				if ( ! ( marketName == 'Washington' ) )
					Response.Write(' accessiblyHidden');
				%>" >
			<div class="Headings">
			<h1>Great Deals in Washington</h1>
			<div class="SubTitle1">Buy with just one click!</div>
		</div><!--(end Headings)-->
		<%
		if ( ! ( inventory.indexOf('Washington/sku01') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Washington/sku01/">
				<img alt="[deal described in text]" src="/images/deal/deal01.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Washington/sku01"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="70"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Washington/sku01/">Cascading Style Salon and Day Spa</a>
			</h3>
			<p>
				<a href="Washington/sku01/">Haircut with Shampoo and Blow Dry $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Washington/sku02') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Washington/sku02/">
				<img alt="[deal described in text]" src="/images/deal/deal02.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Washington/sku02"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="60"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Washington/sku02/">Coder's Cafe</a>
			</h3>
			<p>
				<a href="Washington/sku02/">Half-Price Dinner $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Washington/sku03') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Washington/sku03/">
				<img alt="[deal described in text]" src="/images/deal/deal03.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Washington/sku03"/>
					<input type="hidden" name="price" value="60"/>
					<input type="hidden" name="value" value="130"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Washington/sku03/">Web Wheels Auto Palace</a>
			</h3>
			<p>
				<a href="Washington/sku03/">Second Day Car Rental Free $60</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Washington/sku04') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Washington/sku04/">
				<img alt="[deal described in text]" src="/images/deal/deal04.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Washington/sku04"/>
					<input type="hidden" name="price" value="40"/>
					<input type="hidden" name="value" value="110"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Washington/sku04/">Metro Area Transit Promotions</a>
			</h3>
			<p>
				<a href="Washington/sku04/">Save 60% on Transit Fare $40</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Washington/sku05') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Washington/sku05/">
				<img alt="[deal described in text]" src="/images/deal/deal05.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Washington/sku05"/>
					<input type="hidden" name="price" value="220"/>
					<input type="hidden" name="value" value="330"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Washington/sku05/">Stylesheets Boutique</a>
			</h3>
			<p>
				<a href="Washington/sku05/">Designer Fashions at a Thrify Price $220</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Washington/sku06') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Washington/sku06/">
				<img alt="[deal described in text]" src="/images/deal/deal06.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Washington/sku06"/>
					<input type="hidden" name="price" value="80"/>
					<input type="hidden" name="value" value="160"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Washington/sku06/">WebSockets WebHosting</a>
			</h3>
			<p>
				<a href="Washington/sku06/">One Year of Web Hosting @ the Six Month Price $80</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Washington/sku07') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Washington/sku07/">
				<img alt="[deal described in text]" src="/images/deal/deal07.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Washington/sku07"/>
					<input type="hidden" name="price" value="30"/>
					<input type="hidden" name="value" value="50"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Washington/sku07/">Save the Planet</a>
			</h3>
			<p>
				<a href="Washington/sku07/">Recycled Products, Reduced Prices! $30</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Washington/sku08') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Washington/sku08/">
				<img alt="[deal described in text]" src="/images/deal/deal08.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Washington/sku08"/>
					<input type="hidden" name="price" value="330"/>
					<input type="hidden" name="value" value="550"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Washington/sku08/">Web Workers Workouts</a>
			</h3>
			<p>
				<a href="Washington/sku08/">Two Year Gym Membership $330</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	
		<%
		if ( ! ( inventory.indexOf('Washington/sku09') >= 0 ) )
		{
			%>
			<div class="SectionContainer deal-summary deal">
			<a class="deal-image-anchor" href="Washington/sku09/">
				<img alt="[deal described in text]" src="/images/deal/deal09.jpg"/>
			</a>
			<form class="summary-buy-form buy-form" action="/" method="post">
				<div>
					<input type="hidden" name="sku" value="Washington/sku09"/>
					<input type="hidden" name="price" value="160"/>
					<input type="hidden" name="value" value="330"/>
					<input type="submit" name="submit" value="Buy" class="siteSubmit"/>
				</div>
			</form>
			<h3 class="Title">
				<a href="Washington/sku09/">Hypertext Hotel</a>
			</h3>
			<p>
				<a href="Washington/sku09/">Second Night On Us! $160</a>
			</p>
		</div><!--(end SectionContainer)-->
			<%
		}
		%>
	<div style="clear:left;font-size:1px;"> </div>
		</div>
	  <div class="Footer">
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