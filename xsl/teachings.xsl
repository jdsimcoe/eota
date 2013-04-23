<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-teachings">

	<xsl:param name="component" select="'teachings'" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<xsl:if test="$pt3 = 'series' and not($pt4)">
		<div class="title-wrapper">
			<div class="container">
				<div class="row">
					<div class="span12">
						<h2 style="text-align: center !important;">
							<xsl:text>Teaching Series</xsl:text>
						</h2>
					</div>
				</div>
			</div>
		</div>
		<div class="component component-teachings">
			<div class="container">
				<div class="component-series">
					<div class="row">
						<xsl:for-each select="//teachings-series-entries-all/entry[not(special) or special = 'No']">
							<div class="span4 series">
								<a>
									<xsl:call-template name="url-teachings-series" />
									<xsl:call-template name="teaching-poster-or-default">
										<xsl:with-param name="poster" select="poster" />
									</xsl:call-template>
								</a>
								<div class="info">
									<a>
										<xsl:call-template name="url-teachings-series" />
										<h4 class="center">
											<xsl:value-of select="title" disable-output-escaping="yes" />
										</h4>
									</a>
								</div>
							</div>
						</xsl:for-each>
					</div>
					<div class="row">
						<br/>
						<h2 id="special" class="center">Special Series</h2>
						<xsl:for-each select="//teachings-series-entries-all/entry[special = 'Yes']">
							<div class="span4 series">
								<a>
									<xsl:call-template name="url-teachings-series" />
									<xsl:call-template name="teaching-poster-or-default">
										<xsl:with-param name="poster" select="poster" />
									</xsl:call-template>
								</a>
								<div class="info">
									<a>
										<xsl:call-template name="url-teachings-series" />
										<h4 class="center">
											<xsl:value-of select="title" disable-output-escaping="yes" />
											<xsl:if test="featured = 'Yes'">
												<xsl:text>&#160;</xsl:text>
												<span class="label accent">Featured</span>
												<xsl:text>&#160;</xsl:text>
											</xsl:if>
										</h4>
									</a>
								</div>
							</div>
						</xsl:for-each>
					</div>
				</div>
			</div>
		</div>
	</xsl:if>

	<xsl:if test="count($entries)">

		<xsl:choose>
			<xsl:when test="not(number($pt3)) and not(number($pt4)) and $pt4">
				<div class="title-wrapper">
					<div class="container">
						<div class="row">
							<div class="span12">
								<h2>
									<xsl:choose>
										<xsl:when test="$pt4 = 'psalm'">
											<xsl:text>Psalms</xsl:text>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="$pt4" />
										</xsl:otherwise>
									</xsl:choose>
								</h2>
							</div>
						</div>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="not(number($pt3)) and number($pt4) and $pt5">
				<div class="title-wrapper">
					<div class="container">
						<div class="row">
							<div class="span12">
								<h2>
									<xsl:text>Series: </xsl:text>
									<em>
										<xsl:call-template name="string-replace-all">
			                <xsl:with-param name="text" select="$pt5" />
			                <xsl:with-param name="replace" select="'-'" />
			                <xsl:with-param name="by" select="' '" />
			              </xsl:call-template>
									</em>
								</h2>
							</div>
						</div>
					</div>
				</div>
			</xsl:when>
			<xsl:when test="$pt3 = 'tag'">
				<div class="title-wrapper">
					<div class="container">
						<div class="row">
							<div class="span12">
								<h2>
									<xsl:text>Tag: </xsl:text>
									<em>
										<xsl:value-of select="//teachings-entry-by-tag-filtered/entry/tags/item[@id=$pt4]/tag/@handle" disable-output-escaping="yes" />
									</em>
								</h2>
							</div>
						</div>
					</div>
				</div>
			</xsl:when>
			<xsl:otherwise>
			</xsl:otherwise>
		</xsl:choose>
		<div>
			<xsl:call-template name="class-position">
				<xsl:with-param name="component" select="$component" />
			</xsl:call-template>
			<div class="row">
				<xsl:choose>
	 				<xsl:when test="number($pt3)">
						<div class="span12">
							<xsl:for-each select="$entries">
								<div class="result">
									<xsl:attribute name="class">
										<xsl:if test="number($pt3)">
											<xsl:text>result individual</xsl:text>
										</xsl:if>
									</xsl:attribute>
									<xsl:call-template name="teaching-entry" />
								</div>
							</xsl:for-each>
						</div>
					</xsl:when>
					<xsl:when test="$pt3 = 'book' or $pt3 = 'tag' or $pt3 = 'year' or $pt3 = 'series'">
						<div class="span12 poster">
							<xsl:if test="$pt3 = 'series'">
								<img src="/workspace/img/spacer.gif" width="100%" style="height:529px">
									<xsl:attribute name="data-responsimage">
										<xsl:value-of select="//teachings-series-entries-all/entry[@id = $pt4]/poster/item/image/filename" disable-output-escaping="yes" />
									</xsl:attribute>
								</img>
								<xsl:if test="//teachings-series-entries-all/entry[@id = $pt4]/description != ''">
							    <div class="container">
							      <div class="row">
								    	<div class="span12 center">
												<span class="intro big">
													<xsl:value-of select="//teachings-series-entries-all/entry[@id = $pt4]/description" disable-output-escaping="yes" />
												</span>
								    	</div>
							      </div>
							      <hr class="soften"/>
							    </div>
								</xsl:if>
							</xsl:if>
						</div>
						<div class="span8 results">
							<h3>
								<xsl:choose>
									<xsl:when test="$pt3 = 'series'">
										<xsl:text disable-output-escaping="yes">Teachings</xsl:text>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$entries/../pagination/@total-entries" disable-output-escaping="yes" />
										<xsl:text disable-output-escaping="yes"> results</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
							</h3>
							<xsl:for-each select="$entries">
								<div class="result">
									<xsl:call-template name="teaching-entry" />
								</div>
							</xsl:for-each>
							<xsl:call-template name="teachings-pagination">
								<xsl:with-param name="entries" select="$entries" />
							</xsl:call-template>
						</div>
					</xsl:when>
					<xsl:otherwise>
						<xsl:for-each select="//teachings-featured-filtered/entry">
							<div class="latest">
								<div class="row">
									<div class="span8 offset2">
										<div class="search visible-desktop">
											<form method="get">
												<xsl:call-template name="form-search-action"/>
												<a>
													<xsl:call-template name="url-search-home" />
													<span class="icon">s</span>
												</a>
												<input type="hidden" name="sections" value="teachings,teachings-tags,teachings-series" />
												<input class="keywords" name="keywords" onclick="this.select()" placeholder="Search" autocomplete="off" />
											</form>
										</div>
									</div>
								</div>
								<div class="span8">
									<h3>Latest Teaching</h3>
									<ul class="nav nav-tabs" id="teachingTab">
								  	<xsl:choose>
											<xsl:when test="video/item">
												<li class="active"><a href="#video" data-toggle="tab">Video</a></li>
												<li><a href="#audio" data-toggle="tab">Audio</a></li>
											</xsl:when>
											<xsl:otherwise>
												<li class="active"><a href="#audio" data-toggle="tab">Audio</a></li>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="$cookie-username">
											<li class="pull-right">
												<xsl:call-template name="edit-entry">
													<xsl:with-param name="component" select="'teachings'"/>
												</xsl:call-template>
											</li>
										</xsl:if>
									</ul>
									<div class="tab-content">
										<xsl:choose>
											<xsl:when test="video/item">
												<div class="tab-pane fade active in" id="video">
													<iframe src="http://player.vimeo.com/video/{video/item/id}?title=0&amp;byline=0&amp;portrait=0&amp;color=d83629" frameborder="0" class="video" webkitAllowFullScreen="webkitAllowFullScreen" mozallowfullscreen="mozallowfullscreen" allowFullScreen="allowFullScreen" style="width: 100%; height: 348px; "></iframe>
												</div>
												<div class="tab-pane fade in" id="audio">
													<div class="audio-poster">
														<img style="width:620px; height:348px" src="/workspace/img/spacer.gif">
															<xsl:attribute name="data-responsimage">
																<xsl:choose>
																	<xsl:when test="string-length(poster/item)">
																		<xsl:value-of select="poster/item/image/filename" disable-output-escaping="yes" />
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">accf-flat-4fc3e05b81747.jpg</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:attribute>
														</img>
													</div>
													<xsl:call-template name="teaching-actions" />
												</div>
											</xsl:when>
											<xsl:otherwise>
												<div class="tab-pane fade active in" id="audio">
													<div class="audio-poster">
														<img style="width:620px; height:348px" src="/workspace/img/spacer.gif">
															<xsl:attribute name="data-responsimage">
																<xsl:choose>
																	<xsl:when test="string-length(poster/item)">
																		<xsl:value-of select="poster/item/image/filename" disable-output-escaping="yes" />
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:text disable-output-escaping="yes">accf-flat-4fc3e05b81747.jpg</xsl:text>
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:attribute>
														</img>
													</div>
													<xsl:call-template name="teaching-actions" />
												</div>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<div class="span4">
									<h2>
										<a>
											<xsl:call-template name="url-teachings" />
											<xsl:value-of select="title" disable-output-escaping="yes" />
										</a>
									</h2>
									<div class="meta">
										<div class="verse">
											<xsl:value-of select="book/item" />
											<xsl:text> </xsl:text>
											<xsl:value-of select="chapter" />
										</div>
										<div class="teacher">
											<em>by </em>
											<xsl:value-of select="speaker/item/first-name" disable-output-escaping="yes" />
											<xsl:text disable-output-escaping="yes"> </xsl:text>
											<xsl:value-of select="speaker/item/last-name" disable-output-escaping="yes" />
										</div>
										<div class="date">
											<xsl:call-template name="date-teaching">
												<xsl:with-param name="date" select="date/date/start/@iso" />
											</xsl:call-template>
										</div>
									</div>
									<div class="description">
										<xsl:call-template name="truncate">
                        <xsl:with-param name="node" select="description" />
                        <xsl:with-param name="length" select="230" />
                    </xsl:call-template>
									</div>
									<xsl:if test="tags/item">
										<xsl:call-template name="teaching-tag-list">
											<xsl:with-param name="tags" select="tags/item" />
										</xsl:call-template>
									</xsl:if>
								</div>
							</div>
						</xsl:for-each>
						<div class="span8">
							<xsl:variable name="items-per-row" select="2" />
							<div class="component-series">
								<h3>Teaching Series</h3>
								<div class="row">
								<xsl:for-each select="//teachings-series-entries-filtered/entry[position() &lt; 5]">
									<div class="span4 series">
										<a>
											<xsl:call-template name="url-teachings-series" />
											<xsl:call-template name="teaching-poster-or-default">
												<xsl:with-param name="poster" select="poster" />
											</xsl:call-template>
										</a>
										<div class="info">
											<a>
												<xsl:call-template name="url-teachings-series" />
												<h4>
													<xsl:value-of select="title" disable-output-escaping="yes" />
													<span class="meta">
														<xsl:text> (</xsl:text>
														<xsl:value-of select="teachings/@items" />
														<xsl:text>&#160;teachings)</xsl:text>
													</span>
												</h4>
											</a>
										</div>
									</div>
								</xsl:for-each>
								</div>
								<p class="center">
									<a class="link link-big inline" href="/21/teachings/series">
										<xsl:text>All Teaching Series</xsl:text>
									</a>
								</p>
								<hr/>
								<h3>Special Series</h3>
								<div class="row">
									<xsl:for-each select="//teachings-series-entries-special/entry[position() &lt; 5]">
										<div class="span4 series">
											<a>
												<xsl:call-template name="url-teachings-series" />
												<xsl:call-template name="teaching-poster-or-default">
													<xsl:with-param name="poster" select="poster" />
												</xsl:call-template>
											</a>
											<div class="info">
												<a>
													<xsl:call-template name="url-teachings-series" />
													<h4>
														<xsl:value-of select="title" disable-output-escaping="yes" />
														<span class="meta">
															<xsl:text> (</xsl:text>
															<xsl:value-of select="teachings/@items" />
															<xsl:text>&#160;teachings)</xsl:text>
														</span>
													</h4>
												</a>
											</div>
										</div>
									</xsl:for-each>
								</div>
								<p class="center">
									<a class="link link-big inline" href="/21/teachings/series/#special">
										<xsl:text>All Special Series</xsl:text>
									</a>
								</p>
							</div>
							<h3>Recent Teachings</h3>
								<div class="row">
								  <xsl:for-each select="//teachings-4-latest/entry">
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
		                        <xsl:with-param name="length" select="110" />
		                      </xsl:call-template>
		                    </div>
                  		</a>
                  	</div>
                	</xsl:for-each>
              	</div>
              	<h3>Radio</h3>
              	<div class="row podcast last">
              		<div class="span8">
										<p>Our “Day-by-Day” radio show with Pastor Brett Meador plays on the follow stations:</p>
									</div>
								</div>
								<div class="row">
									<div class="span3">
										<h4>Portland</h4>
										<p>
											<em>Monday through Friday</em><br />
											KPDQ <a href="http://www.truetalk800.com" target="_blank">800 AM</a> at 8:30 am<br />
											KPDQ <a href="http://www.kpdq.com" target="_blank">93.9 FM</a> at 10:00 pm<br />
										</p>
									</div>
									<div class="span3">
										<h4>Southern Oregon</h4>
										<p>
											<em>Monday through Friday</em><br />
											KAPL <a href="http://www.kaplradio.org" target="_blank">1300 AM</a> at 1:30 pm<br />
											KAPL <a href="http://www.kaplradio.org" target="_blank">1300 AM</a> at 11:30 pm<br />
										</p>
									</div>
									<div class="span2">
										<h4>Vanuatu</h4>
										<p>
											<em>Everyday</em><br />
											NAMBAWAN 98 FM at 5:00 pm
										</p>
									</div>
								</div>
						</div>
					</xsl:otherwise>
				</xsl:choose>
				<xsl:choose>
					<xsl:when test="$position = 'column-full-width' and not(number($pt3))">
						<div class="span4">
							<h3>Search</h3>
							<div class="widget filter">
								<h4>Books of the Bible</h4>
								<h5>Old Testament</h5>
								<div class="collection books">
									<xsl:for-each select="//books-of-the-bible/entry[ testament/@handle = 'old-testament' ]">
										<xsl:call-template name="bible-book">
											<xsl:with-param name="book" select="name" />
										</xsl:call-template>
										<xsl:if test="position() &lt; last()">, </xsl:if>
									</xsl:for-each>
								</div>
								<h5>New Testament</h5>
								<div class="collection books">
									<xsl:for-each select="//books-of-the-bible/entry[ testament/@handle = 'new-testament' ]">
										<xsl:call-template name="bible-book">
											<xsl:with-param name="book" select="name" />
										</xsl:call-template>
										<xsl:if test="position() &lt; last()">, </xsl:if>
									</xsl:for-each>
								</div>
							</div>
							<div class="widget filter">
								<h4>Year</h4>
								<div class="collection">
									<xsl:call-template name="years-counter" />
								</div>
							</div>
							<div class="widget filter">
								<h4>Tags</h4>
								<div class="inline-search">
									<form>
										<xsl:attribute name="action">
											<xsl:call-template name="url-search-home">
												<xsl:with-param name="url-only" select="true()" />
											</xsl:call-template>
										</xsl:attribute>
										<label for="keywords"><span class="icon">s</span></label>
										<input type="hidden" name="sections" value="teachings-tags" />
										<input name="keywords" class="keywords" placeholder="Search" autocomplete="off" onclick="this.select()" />
									</form>
								</div>
								<div class="collection">
									<xsl:for-each select="//teachings-tags-random-filtered/entry">
										<a href="{$root}/{//tags-all-entries/entry[tag/@handle = 'teachings']/@id}/teachings/tag/{@id}/">
											<xsl:value-of select="tag" disable-output-escaping="yes" />
										</a>
										<xsl:if test="position() &lt; last()">, </xsl:if>
									</xsl:for-each>
								</div>
								<!-- <a href="" class="more"><span class="icon">z</span> See all tags</a> -->
							</div>
							<h3>Podcast</h3>
              	<div class="podcast">
              		<div>
										<p>One of the best ways to connect to our Bible teachings is through podcasts. Our Audio Podcast streams all of our latest teachings to your device(s).</p>
										<p class="center">
											<a class="link link-big inline">
												<xsl:attribute name="href">
													<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='podcast-audio']/content)" disable-output-escaping="yes" />
												</xsl:attribute>
												<xsl:text>View in iTunes</xsl:text>
											</a>
										</p>
									</div>
								</div>
						</div>
					</xsl:when>
				</xsl:choose>
			</div>
		</div>
	</xsl:if>

</xsl:template>

<xsl:template name="teaching-series-entry">
	<xsl:param name="entry" select="." />
	<xsl:for-each select="$entry">
		<div class="row">
			<div class="span12">
				<a>
					<xsl:call-template name="url-teachings-series" />
					<xsl:call-template name="teaching-poster-or-default">
						<xsl:with-param name="poster" select="poster" />
					</xsl:call-template>
				</a>
			</div>
		</div>
		<div class="carousel-caption">
			<a>
				<xsl:call-template name="url-teachings-series" />
				<h3>
					<xsl:text>Featured Series: </xsl:text>
					<em class="verse">
						<xsl:text> </xsl:text>
						<xsl:value-of select="title" />
					</em>
				</h3>
			</a>
		</div>
	</xsl:for-each>
</xsl:template>


<xsl:template name="teaching-entry">

	<xsl:param name="entry" select="." />

	<xsl:for-each select="$entry">
		<xsl:if test="not($pt1)">
			<div class="row">
				<div class="span12">
					<a>
						<xsl:call-template name="url-teachings" />
							<img style="width: 940px; height: 529px" src="/workspace/img/spacer.gif">
								<xsl:attribute name="data-responsimage">
									<xsl:choose>
										<xsl:when test="string-length(poster/item)">
											<xsl:value-of select="poster/item/image/filename" disable-output-escaping="yes" />
										</xsl:when>
										<xsl:otherwise>
											<xsl:text disable-output-escaping="yes">accf-flat-4fc3e05b81747.jpg</xsl:text>
										</xsl:otherwise>
									</xsl:choose>
								</xsl:attribute>
							</img>
					</a>
				</div>
			</div>
			<div class="carousel-caption">
				<a>
					<xsl:call-template name="url-teachings" />
					<h3>
						<xsl:text>Featured Teaching: </xsl:text>
						<em class="verse">
							<xsl:text> </xsl:text>
							<xsl:value-of select="book/item" />
							<xsl:text> </xsl:text>
							<xsl:value-of select="chapter" />
						</em>
					</h3>
				</a>
			</div>
		</xsl:if>
		<xsl:if test="number($pt3)">

			<div class="title-wrapper">
				<div class="container">
					<div class="row">
						<div class="span12 center">
							<h2>
								<xsl:value-of select="title" disable-output-escaping="yes" />
								<span class="verse">
									<xsl:text>&#160;&#160;(</xsl:text>
									<xsl:if test="book/item != ''">
										<xsl:value-of select="book/item" />
										<xsl:text> </xsl:text>
									</xsl:if>
									<xsl:value-of select="chapter" />
									<xsl:text>)</xsl:text>
								</span>
							</h2>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="span8">
					<ul class="nav nav-tabs" id="teachingTab">
						<xsl:choose>
							<xsl:when test="video/item">
								<li class="active"><a href="#video" data-toggle="tab">Video</a></li>
								<li><a href="#audio" data-toggle="tab">Audio</a></li>
							</xsl:when>
							<xsl:otherwise>
								<li class="active"><a href="#audio" data-toggle="tab">Audio</a></li>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="$cookie-username">
							<li class="pull-right">
								<xsl:call-template name="edit-entry">
									<xsl:with-param name="component" select="'teachings'"/>
								</xsl:call-template>
							</li>
						</xsl:if>
					</ul>
					<div class="tab-content">
						<xsl:choose>
							<xsl:when test="video/item">
								<div class="tab-pane fade active in" id="video">
									<iframe src="http://player.vimeo.com/video/{video/item/id}?title=0&amp;byline=0&amp;portrait=0&amp;color=d83629" frameborder="0" class="video" webkitAllowFullScreen="webkitAllowFullScreen" mozallowfullscreen="mozallowfullscreen" allowFullScreen="allowFullScreen" style="width: 100%; height: 348px; "></iframe>
								</div>
								<div class="tab-pane fade in" id="audio">
									<div class="audio-poster">
										<img style="width:620px; height:348px" src="/workspace/img/spacer.gif">
											<xsl:attribute name="data-responsimage">
												<xsl:choose>
													<xsl:when test="string-length(poster/item)">
														<xsl:value-of select="poster/item/image/filename" disable-output-escaping="yes" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:text disable-output-escaping="yes">accf-flat-4fc3e05b81747.jpg</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
										</img>
									</div>
									<xsl:call-template name="teaching-actions" />
								</div>
							</xsl:when>
							<xsl:otherwise>
								<div class="tab-pane fade active in" id="audio">
									<div class="audio-poster">
										<img style="width:620px; height:348px" src="/workspace/img/spacer.gif">
											<xsl:attribute name="data-responsimage">
												<xsl:choose>
													<xsl:when test="string-length(poster/item)">
														<xsl:value-of select="poster/item/image/filename" disable-output-escaping="yes" />
													</xsl:when>
													<xsl:otherwise>
														<xsl:text disable-output-escaping="yes">accf-flat-4fc3e05b81747.jpg</xsl:text>
													</xsl:otherwise>
												</xsl:choose>
											</xsl:attribute>
										</img>
									</div>
									<xsl:call-template name="teaching-actions" />
								</div>
							</xsl:otherwise>
						</xsl:choose>

					</div>
				</div>
				<div class="span4">
					<div class="teacher">
						<em>by </em>
						<strong>
							<xsl:value-of select="speaker/item/first-name" disable-output-escaping="yes" />
							<xsl:text disable-output-escaping="yes"> </xsl:text>
							<xsl:value-of select="speaker/item/last-name" disable-output-escaping="yes" />
						</strong>
					</div>
					<div class="avatar">
						<xsl:call-template name="speaker-avatar">
							<xsl:with-param name="photo" select="speaker/item/photo" />
							<xsl:with-param name="height" select="140" />
							<xsl:with-param name="width" select="140" />
						</xsl:call-template>
					</div>
					<div class="about">
						<xsl:value-of select="speaker/item/about" disable-output-escaping="yes" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="span8">
					<div class="meta">
						<p>
							<span class="badge">
								<xsl:value-of select="filename" />
							</span>
							<span class="date">
								<span class="divider">|</span>
								<xsl:call-template name="date-teaching">
									<xsl:with-param name="date" select="date/date/start/@iso" />
								</xsl:call-template>
							</span>
						</p>
					</div>
					<div class="description">
						<xsl:value-of select="description"  disable-output-escaping="yes" />
					</div>
					<xsl:if test="tags/item">
						<xsl:call-template name="teaching-tag-list">
							<xsl:with-param name="tags" select="tags/item" />
						</xsl:call-template>
					</xsl:if>
				</div>
				<div class="span4">
					<h3>Share</h3>
					<div class="input-append" style="width:100%;">
					  <input type="text" name="permalink" value="http://accf.co/{$pt3}" onclick="this.select()" />
					  <span class="add-on">
					  	<a class="tweet">
						  	<xsl:attribute name="href">
									<xsl:text>http://twitter.com/intent/tweet?text=</xsl:text>
										<xsl:variable name="title-verse">
										  <xsl:value-of select="title" />
										  <xsl:text> | </xsl:text>
										  <xsl:value-of select="book/item" />
										  <xsl:text> </xsl:text>
										  <xsl:value-of select="chapter" />
										</xsl:variable>
									  <xsl:if test="string-length($title-verse) &gt; 1">
									    <xsl:call-template name="url-encode">
									      <xsl:with-param name="str" select="$title-verse"/>
									    </xsl:call-template>
									  </xsl:if>
									<xsl:text>%3A+http%3A%2F%2Faccf.co/</xsl:text>
									<xsl:value-of select="$pt3" disable-output-escaping="yes" />
								</xsl:attribute>
						  	<span class="icon big">B</span>
					  	</a>
					  </span>
					</div>
				</div>
				<div class="span12">
					<br /><br />
					<hr class="soften" />
					<br /><br />
					<xsl:value-of select="normalize-space(//misc-all-entries/entry[name='main-podcast']/content)" disable-output-escaping="yes" />
				</div>
			</div>

		</xsl:if>

		<xsl:if test="not(number($pt3))">
			<xsl:choose>
				<xsl:when test="not($pt1)">
				</xsl:when>
				<xsl:otherwise>
					<h4>
						<a>
							<xsl:call-template name="url-teachings" />
							<xsl:value-of select="title" disable-output-escaping="yes" />
							<span class="verse">
								<xsl:value-of select="book/item" />
								<xsl:text> </xsl:text>
								<xsl:value-of select="chapter" />
							</span>
						</a>
					</h4>
					<div class="meta">
						<p>
							<span class="badge">
								<xsl:value-of select="filename" />
							</span>
							<span class="teacher">
								<em>by </em>
								<xsl:value-of select="speaker/item/first-name" disable-output-escaping="yes" />
								<xsl:text disable-output-escaping="yes"> </xsl:text>
								<xsl:value-of select="speaker/item/last-name" disable-output-escaping="yes" />
							</span>
							<span class="verse">
								<span class="icon">u</span>
								<xsl:text> </xsl:text>
								<xsl:value-of select="book/item" />
								<xsl:text> </xsl:text>
								<xsl:value-of select="chapter" />
							</span>
							<span class="divider">|</span>
							<span class="date">
								<xsl:call-template name="format-date">
									<xsl:with-param name="date" select="date/date/start/@iso" />
									<xsl:with-param name="format" select="'%m+; %d;%ds;, %y+;'" />
								</xsl:call-template>
							</span>
						</p>
					</div>
					<div class="description">
						<xsl:value-of select="description" disable-output-escaping="yes" />
					</div>
					<xsl:call-template name="teaching-tag-list">
						<xsl:with-param name="tags" select="tags/item" />
					</xsl:call-template>
					<div class="download">
						<xsl:variable name="audio-url">
							<xsl:text disable-output-escaping="yes">http://66.147.244.244/~atheycre/teachings/</xsl:text>
							<xsl:value-of select="translate(filename,$en-uppercase-letters,$en-lowercase-letters)"/>
							<xsl:text>.mp3</xsl:text>
						</xsl:variable>
						<a href="{$audio-url}" class="link link-small downloadPopover" rel="popover" data-content="Right-click on this link and use the 'Save As' or 'Download File As' dialog to download teachings." data-original-title="Downloads" data-placement="top" target="_blank">
				    	<span class="icon">d</span>
				    	<span class="text">Download</span>
				    </a>
					</div>

				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:for-each>

</xsl:template>


<xsl:template name="teaching-actions">

	<xsl:param name="entry" select="." />

	<xsl:variable name="audio-url">
		<!-- <xsl:text>http://72.10.33.203/media/audio/teachings/</xsl:text> -->
		<xsl:text disable-output-escaping="yes">http://66.147.244.244/~atheycre/teachings/</xsl:text>
		<xsl:value-of select="translate(filename,$en-uppercase-letters,$en-lowercase-letters)"/>
		<xsl:text>.mp3</xsl:text>
	</xsl:variable>

	<div class="teaching-actions">

		<div class="audio-container">
			<audio controls="" preload="none" src="{$audio-url}"></audio>
		</div>

		<a href="{$audio-url}" class="link link-small downloadPopover pull-left" rel="popover" data-content="Right-click on this link and use the 'Save As' or 'Download File As' dialog to download teachings." data-original-title="Downloads" data-placement="top" target="_blank">
    	<span class="icon">d</span>
    	<span class="text">Download</span>
    </a>

	</div>

</xsl:template>


<xsl:template name="teaching-tag-list">

	<xsl:param name="tags" />

	<div class="tags">
		<span class="icon">z</span>
		<xsl:for-each select="tags/item">
			<a>
				<xsl:call-template name="url-teachings-tags" />
				<xsl:value-of select="tag" disable-output-escaping="yes" />
			</a>
			<xsl:if test="position() &lt; last()">,</xsl:if>
			<xsl:text> </xsl:text>
		</xsl:for-each>
	</div>

</xsl:template>


<xsl:template name="date-teaching">

	<xsl:param name="date" />

	<xsl:call-template name="format-date">
		<xsl:with-param name="date" select="$date" />
		<xsl:with-param name="format" select="'%d+;, %m+; %d;%ds;, %y+;'" />
	</xsl:call-template>

</xsl:template>


<xsl:template name="bible-book">

	<xsl:param name="book" />

	<xsl:choose>
		<xsl:when test="$book = 'Psalms'">
			<a href="{$root}/{//tags-all-entries/entry[tag/@handle = 'teachings']/@id}/teachings/book/psalm/">
				<xsl:text>Psalms</xsl:text>
			</a>
		</xsl:when>
		<xsl:otherwise>
			<a href="{$root}/{//tags-all-entries/entry[tag/@handle = 'teachings']/@id}/teachings/book/{$book/@handle}/">
				<xsl:value-of select="$book" />
			</a>
		</xsl:otherwise>
	</xsl:choose>

</xsl:template>


<xsl:template name="years-counter">

	<xsl:param name="howMany">1997</xsl:param>

	<xsl:if test="$howMany &lt; $this-year + 1">
		<a href="{$root}/{$pt1}/{$pt2}/year/{$howMany}/"><xsl:value-of select="$howMany" /></a>
		<xsl:if test="$howMany &lt; $this-year">, </xsl:if>
		<xsl:call-template name="years-counter">
		<xsl:with-param name="howMany" select="$howMany + 1" />
		</xsl:call-template>
	</xsl:if>

</xsl:template>


<xsl:template name="teaching-poster-or-default">

	<xsl:param name="poster" />

	<img style="width: 100%; height: 169px" src="/workspace/img/spacer.gif">
		<xsl:attribute name="data-responsimage">
			<xsl:choose>
				<xsl:when test="string-length(poster/item)">
					<xsl:value-of select="$poster/item/image/filename" disable-output-escaping="yes" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">accf-flat-4fc3e05b81747.jpg</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</img>

</xsl:template>

<xsl:template name="teachings-pagination">

	<xsl:param name="entries" />

	<xsl:call-template name="cd-pagination">
		<xsl:with-param name="pagination" select="$entries/../pagination" />
		<xsl:with-param name="pagination-url">
			<xsl:value-of select="$root" /><xsl:text>/</xsl:text>
			<xsl:if test="$pt1">
				<xsl:value-of select="$pt1" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt2">
				<xsl:value-of select="$pt2" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt3">
				<xsl:value-of select="$pt3" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt4">
				<xsl:value-of select="$pt4" /><xsl:text>/</xsl:text>
			</xsl:if>
			<xsl:if test="$pt5">
				<xsl:value-of select="'$'" /><xsl:text>/</xsl:text>
			</xsl:if>
		</xsl:with-param>
	</xsl:call-template>

</xsl:template>

<xsl:template name="speaker-avatar">

	<xsl:param name="photo" />
	<xsl:param name="width" />
	<xsl:param name="height" />

	<img width="{$width}" height="{$height}" class="img-circle" data-responsimage-anchor="5" src="/workspace/img/spacer.gif">
		<xsl:attribute name="data-responsimage">
			<xsl:choose>
				<xsl:when test="string-length($photo)">
					<xsl:value-of select="$photo" disable-output-escaping="yes" />
				</xsl:when>
				<xsl:otherwise>
					<xsl:text disable-output-escaping="yes">anonymous-4fef5a675fd64.jpg</xsl:text>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:attribute>
	</img>

</xsl:template>


</xsl:stylesheet>