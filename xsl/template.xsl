<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	encoding="UTF-8"
	method="xml"
	omit-xml-declaration="yes"
	indent="no"
	/>

<xsl:template name="template-head">
  <link rel="stylesheet" href="{$workspace}/themes/active/css/common.css" />
<!-- 	<link rel="stylesheet" href="{$workspace}/themes/active/css/athey.2.5.0.css" /> -->
	<xsl:comment><![CDATA[[if IE 7]> <link rel="stylesheet" href="/workspace/themes/active/css/ie7.css" /> <![endif]]]></xsl:comment>
	<link rel="canonical" href="{$current-url}" />
	<xsl:choose>
		<xsl:when test="number($pt1) and $pt1 = 20 and $pt3 or number($pt1) and $pt1 = 20 and $pt3">
			<link rel="shorturl" href="http://accf.co/{$pt3}" />
			<link rel="shortlink" href="http://accf.co/{$pt3}" />
		</xsl:when>
		<xsl:otherwise>
			<link rel="shorturl" href="http://accf.co/{$pt1}" />
			<link rel="shortlink" href="http://accf.co/{$pt1}" />
		</xsl:otherwise>
	</xsl:choose>
	<link rel="dns-prefetch" href="{$root}" />
	<!--
	<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
		<link rel="prerender" href="{$root}/{@id}/{description/@handle}/" />
		<link rel="prefetch" href="{$root}/{@id}/{description/@handle}/" />
	</xsl:for-each>
	<meta http-equiv="x-dns-prefetch-control" content="on" />

	<xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
		<link rel="prerender" href="{$root}/{@id}/{description/@handle}/" />
		<link rel="prefetch" href="{$root}/{@id}/{description/@handle}/" />
	</xsl:for-each>
	-->
	<script src="{$workspace}/themes/active/fonts/typekit.js"></script>
  <script>
  	<xsl:comment>
    var _gaq=[['_setAccount','UA-32000708-1'],['_trackPageview']];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
    g.src=('https:'==location.protocol?'//ssl':'//www')+'.google-analytics.com/ga.js';
    s.parentNode.insertBefore(g,s)}(document,'script'));
  	</xsl:comment>
	</script>

</xsl:template>

<xsl:template name="template-header-outside-container">
  <div class="alerts">
    <xsl:comment><![CDATA[[if lt IE 9]> <div class="alert alert-error">
        <div class="container">
            <p>For the best experience on our site download a modern browser:
              <a href="https://www.google.com/chrome/">Google Chrome &#8594;</a>
            </p>
        </div>
      </div> <![endif]]]></xsl:comment>
    <xsl:call-template name="alerts" />
  </div>
  <div class="navbar main navbar-inverse visible-desktop">
    <div class="navbar-inner">
      <div class="container">
        <div>
          <form class="navbar-search pull-left" action="get">
            <xsl:call-template name="form-search-action" />
            <a>
              <xsl:call-template name="url-search-home" />
              <span class="icon">s</span>
            </a>
            <input name="keywords" type="text" class="search-query" placeholder="Search" autocomplete="off" onclick="this.select()" />
          </form>
          <ul class="nav pull-right">
            <xsl:if test="//status-all-entries/entry[name = 'ustream-status']/content = 'live'">
              <li>
                <a href="{$root}/14097/live/">
                  <xsl:attribute name="class">
                    <xsl:text>modalLiveLink</xsl:text>
                    <xsl:choose>
                      <xsl:when test="//status-all-entries/entry[name = 'ustream-status']/content = 'live'">
                        <xsl:text> online</xsl:text>
                      </xsl:when>
                      <xsl:otherwise>
                        <xsl:text> offline</xsl:text>
                      </xsl:otherwise>
                    </xsl:choose>
                  </xsl:attribute>
                  <span class="icon">V</span>
                  <xsl:text>Live</xsl:text>
                </a>
              </li>
              <li class="divider-vertical"></li>
            </xsl:if>
            <li><a href="{$root}/7761/meetings/">Meetings</a></li>
            <li class="divider-vertical"></li>
            <li><a href="{$root}/13391/im-new-here/">New Here?</a></li>
            <li class="divider-vertical"></li>
            <li><a href="{$root}/24/give/">Give</a></li>
            <li class="divider-vertical"></li>
            <li>
              <xsl:attribute name="class">
                <xsl:choose>
                  <xsl:when test="$cookie-username">
                    <xsl:text>worship</xsl:text>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:text>last worship</xsl:text>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:attribute>
              <a href="{$root}/20/events/12962/tuesday-sunrise-worship/">
                <span class="icon">Z</span>
                <span class="worship">Worship: </span>
                <xsl:value-of select="//misc-all-entries/entry[name='sunrise-worship']/content" disable-output-escaping="yes" />
              </a>
            </li>
            <xsl:if test="$cookie-username">
              <li class="divider-vertical"></li>
              <li class="admin-menu">
                <a href="#" data-toggle="dropdown"><i class="glyphicon-wrench"></i></a>
                <ul class="dropdown-menu">
                  <li>
                    <a href="/symphony/">Symphony</a>
                  </li>
                  <li>
                    <a href="?debug">Debug</a>
                  </li>
                  <xsl:if test="not($pt1 = 'toolkit')">
                    <li>
                      <a>
                        <xsl:attribute name="href">
                          <xsl:choose>
                            <xsl:when test="$pt1">
                              <xsl:value-of select="concat($root, '/symphony/publish/tags/edit/', $pt1, '/')" />
                            </xsl:when>
                            <xsl:otherwise>
                              <xsl:value-of select="concat($root, '/symphony/publish/tags/edit/',//tags-all-entries/entry[tag/@handle = 'home']/@id , '/')" />
                            </xsl:otherwise>
                          </xsl:choose>
                        </xsl:attribute>
                        <xsl:text> Edit Page</xsl:text>
                      </a>
                    </li>
                  </xsl:if>
                  <li>
                    <a href="{$root}/symphony/logout/">Logout</a>
                  </li>
                </ul>
              </li>
            </xsl:if>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <div class="navbar mobile navbar-inverse hidden-desktop">
    <form class="navbar-search pull-left" action="get">
      <xsl:call-template name="form-search-action" />
      <a>
        <xsl:call-template name="url-search-home" />
        <span class="icon">s</span>
      </a>
      <input name="keywords" type="text" class="search-query" placeholder="Search" autocomplete="off" onclick="this.select()" />
    </form>
    <div class="navbar-inner">
        <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </a>
        <div class="nav-collapse">
          <ul class="nav">
            <li><a href="{$root}/13391/im-new-here/">New Here?</a></li>
            <li><a href="{$root}/24/give/">Give</a></li>
            <li>
              <a href="{$root}/20/events/12962/tuesday-sunrise-worship/">
                <span class="icon">Z</span>
                <span class="worship">Sunrise Worship - </span>
                <xsl:value-of select="//misc-all-entries/entry[name='sunrise-worship']/content" disable-output-escaping="yes" />
              </a>
            </li>
            <li class="divider-vertical"></li>
          </ul>
          <ul class="nav">
            <xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
              <xsl:call-template name="subnav-entry" />
            </xsl:for-each>
          </ul>
        </div>

    </div>
  </div>

  <div class="header mast" id="overview">
    <div class="container">
      <div class="row">
        <div class="span12">
          <a href="{$root}" class="logo standard">
            <span class="icon">2</span>
          </a>
          <ul class="main visible-desktop">
            <xsl:for-each select="//tags-all-entries/entry[ not(parent/item) and not(hide-from-header = 'Yes') ]">
              <xsl:call-template name="subnav-entry" />
            </xsl:for-each>
          </ul>
        </div>
      </div>
    </div>
  </div>

	<xsl:if test="not($pt1) or $pt1 = 43">
		<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='tagline']/content)" disable-output-escaping="yes" />
		<div class="feature">
			<div class="container main-container">
				<div class="row home">
					<div id="main-content" class="span12">
						<h3>Featured Content</h3>
						<div id="frontCarousel" class="carousel slide">
              <div class="carousel-inner">
                <div class="item active">
									<xsl:for-each select="//teachings-featured-filtered/entry">
										<xsl:call-template name="teaching-entry" />
									</xsl:for-each>
                </div>
                <div class="item">
									<xsl:for-each select="//teachings-series-featured/entry">
										<xsl:call-template name="teaching-series-entry" />
									</xsl:for-each>
                </div>
	              <xsl:if test="not($pt1) or $pt1 = 43">
									<xsl:call-template name="component-featured">
										<xsl:with-param name="entries" select="//featured-random/entry" />
									</xsl:call-template>
								</xsl:if>
              </div>
              <a class="left carousel-control" href="#frontCarousel" data-slide="prev">&lt;</a>
              <a class="right carousel-control" href="#frontCarousel" data-slide="next">&gt;</a>
            </div>
					</div>
				</div>
			</div>
		</div>
		<div class="events">
			<div class="container">
				<div class="row">
					<div class="span12">
						<xsl:if test="count(//events-3-latest/entry) &gt;= 1">
							<xsl:call-template name="component-events">
								<xsl:with-param name="position" select="'column-home'" />
								<xsl:with-param name="entries" select="//events-3-latest/entry" />
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
			</div>
		</div>
	</xsl:if>
</xsl:template>


<xsl:template name="template-header-inside-container">

	<xsl:variable name="parent" select="//tags-all-entries/entry[@id = $pt1]/parent/item/@id" />

	<xsl:if test="$pt1 and not($pt1 = //tags-all-entries/entry[tag/@handle = 'home']/@id)">
		<div class="subnavs">
			<xsl:for-each select="//tags-all-entries/entry[@id = $pt1]/parent/item/@id">
				<xsl:call-template name="nav-tier" />
			</xsl:for-each>
			<xsl:call-template name="subnav-group">
				<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $pt1 and not(hide-from-header = 'Yes')]" />
			</xsl:call-template>
		</div>

		<div class="subnav-mobile hidden-desktop">
			<xsl:for-each select="//tags-all-entries/entry[@id = $pt1]/parent/item/@id">
				<xsl:call-template name="nav-tier-mobile" />
			</xsl:for-each>
			<xsl:call-template name="subnav-mobile">
				<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $pt1 and not(hide-from-header = 'Yes')]" />
			</xsl:call-template>
		</div>

	</xsl:if>

</xsl:template>


<xsl:template name="nav-tier">

	<xsl:variable name="node" select="." />

	<xsl:for-each select="//tags-all-entries/entry[@id = $node]/parent/item/@id">
		<xsl:call-template name="nav-tier" />
	</xsl:for-each>
	<xsl:call-template name="subnav-group">
		<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $node and not(hide-from-header = 'Yes')]" />
	</xsl:call-template>

</xsl:template>

<xsl:template name="nav-tier-mobile">

	<xsl:variable name="node" select="." />

	<xsl:for-each select="//tags-all-entries/entry[@id = $node]/parent/item/@id">
		<xsl:call-template name="nav-tier-mobile" />
	</xsl:for-each>
	<xsl:call-template name="subnav-mobile">
		<xsl:with-param name="group" select="//tags-all-entries/entry[parent/item/@id = $node and not(hide-from-header = 'Yes')]" />
	</xsl:call-template>

</xsl:template>


<xsl:template name="template-footer-inside-container">

	<xsl:if test="not($pt1) or $pt1 = 43">

		<div class="component-teachings">
			<div class="row">
				<div class="span12">
					<h3>Recent Teachings</h3>
            <div class="row">
              <xsl:for-each select="//teachings-6-latest/entry[position() &lt; 4]">
                <div>
                	<xsl:attribute name="class">
                		<xsl:text>span4 recent number</xsl:text>
                		<xsl:value-of select="position()" />
                	</xsl:attribute>
                  <a>
                      <xsl:call-template name="url-teachings" />

                      <h4>
                        <xsl:value-of select="title" disable-output-escaping="yes" />
                        <xsl:if test="featured = 'Yes'">
                        	<span class="label accent">FEATURED</span>
                        </xsl:if>
                      </h4>

                    <div class="meta">
                        <p>
                            <xsl:call-template name="date-teaching">
                                <xsl:with-param name="date" select="date/date/start/@iso" />
                            </xsl:call-template>
                        </p>
                    </div>
                    <div class="description">
                      <xsl:call-template name="truncate">
                        <xsl:with-param name="node" select="description" />
                        <xsl:with-param name="length" select="100" />
                      </xsl:call-template>
                    </div>
                	</a>
                </div>
              </xsl:for-each>
            </div>
            <div class="row num2">
              <xsl:for-each select="//teachings-6-latest/entry[position() &gt; 3]">
                <div>
                	<xsl:attribute name="class">
                		<xsl:text>span4 recent number</xsl:text>
                		<xsl:value-of select="position()" />
                	</xsl:attribute>
                  <a>
                      <xsl:call-template name="url-teachings" />

                      <h4>
                        <xsl:value-of select="title" disable-output-escaping="yes" />
                        <xsl:if test="featured = 'Yes'">
                        	<span class="label accent">FEATURED</span>
                        </xsl:if>
                      </h4>

                    <div class="meta">
                        <p>
                            <xsl:call-template name="date-teaching">
                                <xsl:with-param name="date" select="date/date/start/@iso" />
                            </xsl:call-template>
                        </p>
                    </div>
                    <div class="description">
                      <xsl:call-template name="truncate">
                        <xsl:with-param name="node" select="description" />
                        <xsl:with-param name="length" select="100" />
                      </xsl:call-template>
                    </div>
                	</a>
                </div>
              </xsl:for-each>
            </div>
				</div>
			</div>

			<div class="component-series">
				<h3 class="title-row">Teaching Series <a href="/21/teachings/series" class="pull-right hidden-phone">All Teaching Series</a></h3>
				<div class="row">
				  <xsl:for-each select="//teachings-series-home-filtered/entry">
		        <div class="span4 series">
							<a>
								<xsl:call-template name="url-teachings-series" />
								<xsl:call-template name="teaching-poster-or-default">
									<xsl:with-param name="poster" select="poster" />
								</xsl:call-template>
							</a>
						</div>
					</xsl:for-each>
					<div class="center visible-phone">
						<a href="/21/teachings/series" class="link-big inline">See All Teachings Series</a>
					</div>
				</div>
				<h3 class="title-row">Special Series <a href="/21/teachings/series/#special" class="pull-right hidden-phone">All Special Series</a></h3>
				<div class="row">
					<xsl:for-each select="//teachings-series-entries-special/entry[position() &lt; 4]">
						<div class="span4 series">
							<a>
								<xsl:call-template name="url-teachings-series" />
								<xsl:call-template name="teaching-poster-or-default">
									<xsl:with-param name="poster" select="poster" />
								</xsl:call-template>
							</a>
						</div>
					</xsl:for-each>
					<div class="center visible-phone">
						<a href="/21/teachings/series/#special" class="link-big inline">See All Special Series</a>
					</div>
				</div>

				<hr/>

				<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='main-podcast']/content)" disable-output-escaping="yes" />

			</div>

		</div>
	</xsl:if>

	<xsl:if test="$pt1 = 14097">
		<div class="broadcast-wrapper">
	    <div class="container">
	      <div class="row">
	        <div class="span12">
	        	<xsl:choose>
							<xsl:when test="//status-all-entries/entry[name = 'ustream-status']/content = 'live'">
								<h2>Live Broadcast</h2>
							</xsl:when>
							<xsl:otherwise>
	          		<h2>Live Broadcast (Offline)</h2>
							</xsl:otherwise>
						</xsl:choose>
	        </div>
	      </div>
	    </div>
	  </div>
		<xsl:choose>
			<xsl:when test="//status-all-entries/entry[name = 'ustream-status']/content = 'live'">
				<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='broadcast-live']/content)" disable-output-escaping="yes" />
				<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='main-podcast']/content)" disable-output-escaping="yes" />
			</xsl:when>
			<xsl:otherwise>
			  <xsl:value-of select="normalize-space(//misc-all-entries/entry[name='broadcast-offline']/content)" disable-output-escaping="yes" />
			  <xsl:value-of select="normalize-space(//misc-all-entries/entry[name='main-podcast']/content)" disable-output-escaping="yes" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:if>

	<div class="footer">
		<div class="footer-nav container">
			<div class="row">
				<div class="span2">
					<ul class="nav nav-list">
						<li class="nav-header first"><a href="/7761/meetings/">Meetings</a></li><br />
						<li class="nav-header"><a href="/21/teachings/">Teachings</a></li><br />
						<li class="nav-header"><a href="/20/events/">Events</a></li><br />
						<li class="nav-header"><a href="/22/ministries/">Ministries</a></li><br />
						<li class="nav-header"><a href="/74/home-groups/">Home Groups</a></li><br />
						<li class="nav-header"><a href="/23/missions/">Missions</a></li><br />
						<li class="nav-header"><a href="/18/about/">About</a></li>
					</ul>
				</div>
				<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='footer']/content)" disable-output-escaping="yes" />
				<div class="span4 twitter">
					<h4><a href="http://twitter.com/atheycreek/" target="_blank">Recently on Twitter</a></h4>
					<ul>
					<xsl:for-each select="//twitter-latest-entry/entry">
						<li>
							<xsl:attribute name="class">
								<xsl:text>entry</xsl:text>
								<xsl:if test="position() = 1">
									<xsl:text> first</xsl:text>
								</xsl:if>
								<xsl:if test="position() = last()">
									<xsl:text> last</xsl:text>
								</xsl:if>
							</xsl:attribute>
							<xsl:value-of select="normalize-space(content)" disable-output-escaping="yes" />
							<xsl:text>&#160;&#160;</xsl:text>
							<strong>
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date/date/start/@iso" />
									<xsl:with-param name="format" select="'%d;'" />
								</xsl:call-template>
								<xsl:text>&#160;</xsl:text>
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date/date/start/@iso" />
									<xsl:with-param name="format" select="'%m-;'" />
								</xsl:call-template>
								<xsl:text>&#160;</xsl:text>
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date/date/start/@iso" />
									<xsl:with-param name="format" select="'%y+;'" />
								</xsl:call-template>
							</strong>
						</li>
					</xsl:for-each>
					</ul>
				</div>
			</div>
		</div>
		<div class="baseline">
			<div class="container">
				<div class="row">
					<div class="span12 center">
						<div class="facebook">
							<a href="https://www.facebook.com/pages/Athey-Creek-Christian-Fellowship/138279749547289">Visit us on Facebook</a>
						</div>
						<div class="copyright">
							<xsl:text>© </xsl:text>
							<a href="{$root}"><xsl:value-of select="$website-name" /></a>
							<xsl:text>. All&#160;rights&#160;reserved. </xsl:text>
							<span class="dev">
						   <a href="{$root}/13667/api/">API</a>
						   <span class="divider">|</span>
						   <a href="http://support.atheycreek.com/" target="_blank">Website Support</a>
						   <span class="divider">| Some photos courtesy of <a href="http://fiftyfootshadows.net" target="_blank">John Carey</a></span>
						   <br />
							</span>
						</div>
						<div class="branding">
							<a href="{root}">&#x2014;<span class="year left">1996</span><span class="icon">0</span><span class="year right"><xsl:value-of select="$this-year" /></span>&#x2014;</a>
						</div>
						<div class="churchdeploy">
							<a href="http://churchdeploy.github.com/">a <strong>Church Deploy</strong> install</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</xsl:template>


<xsl:template name="template-column-right-top"></xsl:template>


<xsl:template name="template-footer-outside-container">

	<script type="text/javascript">
		<xsl:comment>
		(function (window) {
			'use strict';
			function downloadJSAtOnload() {
				var js = {
					"scripts":[
						"/workspace/themes/active/export/combined.js?v=2.1"
					]
				};
				var supportsJson = (!!window.JSON &amp;&amp; !!JSON.parse);

		        if(!supportsJson){
		          js.scripts.push("/workspace/js/json2.js");
		        }
				for (var key in js.scripts) {
					if (js.scripts[key]) {
						var element=document.createElement("script");
						element.src=js.scripts[key];
						document.body.appendChild(element);
					}
				}
			}
			if(window.addEventListener) {
				window.addEventListener("load",downloadJSAtOnload,false);
			} else if (window.attachEvent) {
				window.attachEvent("onload",downloadJSAtOnload);
			} else {
				window.onload=downloadJSAtOnload;
			}
		}(window));
		//</xsl:comment>
	</script>

</xsl:template>


</xsl:stylesheet>