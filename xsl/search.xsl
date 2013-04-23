<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-search">

	<xsl:param name="component" select="'search'" />
	<xsl:param name="position" />
	<xsl:param name="entries" />

	<div class="title-wrapper">
		<div class="container">
			<div class="row">
				<div class="span12">
					<h2>
						<xsl:text>Search</xsl:text>
						<em></em>
						<xsl:if test="$url-keywords">
							<xsl:text>: </xsl:text>
							<em class="none">
								<xsl:choose>
									<xsl:when test="$entries/../pagination/@total-entries">
										<xsl:value-of select="$entries/../pagination/@total-entries" />
									</xsl:when>
									<xsl:otherwise>
										<xsl:text>no</xsl:text>
									</xsl:otherwise>
								</xsl:choose>
								<xsl:text> </xsl:text>
								<xsl:call-template name="pluralize">
									<xsl:with-param name="singular" select="'search result'" />
									<xsl:with-param name="plural" select="'search results'" />
									<xsl:with-param name="xpath" select="$entries/../pagination/@total-entries" />
								</xsl:call-template>
								<xsl:text> for </xsl:text>
								<xsl:text>“</xsl:text>
								<strong>
									<xsl:value-of select="$url-keywords" disable-output-escaping="yes" />
								</strong>
								<xsl:text>”</xsl:text>
							</em>
						</xsl:if>
					</h2>
				</div>
			</div>
		</div>
	</div>

	<div>
		<xsl:call-template name="class-position">
			<xsl:with-param name="component" select="$component" />
		</xsl:call-template>

		<div class="row">
			<div class="span8 offset2">
				<div class="search visible-desktop">
					<form method="get">
						<xsl:call-template name="form-search-action"/>
						<a>
							<xsl:call-template name="url-search-home" />
							<span class="icon">s</span>
						</a>
						<xsl:if test="$url-sections">
							<input type="hidden" name="sections" value="{$url-sections}" />
						</xsl:if>
						<input name="keywords" class="keywords" value="{$url-keywords}" onclick="this.select()" autocomplete="off" />
					</form>
					<p>Type and hit enter. You can search our entire site. Try <span onclick="$('.search input.keywords').val('Jesus');">Jesus</span>, <span onclick="$('.search input.keywords').val('Baptism');">Baptism</span> or <span onclick="$('.search input.keywords').val('Wilsonville');">Wilsonville</span>&#160;..</p>
				</div>
			</div>
		</div>
		<div class="entries results">
			<div class="row">
				<div class="span8">
					<xsl:if test="not(count($entries)) and $url-keywords">
						<p><strong>Sorry about that!</strong><br />Please, try another search or head to the <a href="{$root}">homepage</a></p>
						<xsl:if test="$url-sections">
							<br />
							<p>Try <a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}">searching everywhere</a></p>
						</xsl:if>
					</xsl:if>
					<xsl:for-each select="$entries">
						<xsl:variable name="tag">
							<xsl:value-of select="tags/item/@id" />
						</xsl:variable>
						<xsl:variable name="search-component">
							<xsl:choose>
								<xsl:when test="@section = 'downloads'">
									<xsl:text>downloads</xsl:text>
								</xsl:when>
								<xsl:when test="@section = 'events'">
									<xsl:text>events</xsl:text>
								</xsl:when>
								<xsl:when test="@section = 'events-recurring'">
									<xsl:text>events-recurring</xsl:text>
								</xsl:when>
								<xsl:when test="@section = 'teachings'">
									<xsl:text>teachings</xsl:text>
								</xsl:when>
								<xsl:when test="@section = 'teachings-series'">
									<xsl:text>teachings-series</xsl:text>
								</xsl:when>
								<xsl:when test="@section = 'teachings-tags'">
									<xsl:text>teachings-tags</xsl:text>
								</xsl:when>
								<xsl:when test="@section = 'text'">
									<xsl:text>text</xsl:text>
								</xsl:when>
							</xsl:choose>
						</xsl:variable>
						<xsl:choose>
							<xsl:when test="@section = 'downloads'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$component"/>
									</xsl:call-template>
									<a target="_blank">
										<xsl:call-template name="url-downloads" />
										<h3>
												<xsl:value-of select="name" disable-output-escaping="yes" />
												<span class="label">Downloads</span>
										</h3>
									</a>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'events' or @section = 'events-recurring'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$search-component"/>
									</xsl:call-template>
									<a>
										<xsl:call-template name="url-events" />
										<h3>
											<xsl:value-of select="name" disable-output-escaping="yes" />
											<xsl:choose>
												<xsl:when test="@section = 'events-recurring'">
													<span class="label">Bible Study</span>
												</xsl:when>
												<xsl:otherwise>
													<span>
														<xsl:attribute name="class">
															<xsl:choose>
																<xsl:when test="tags/item/@id = '25'">
																	<xsl:text>label men nohover color-only</xsl:text>
																</xsl:when>
																<xsl:when test="tags/item/@id = '26'">
																	<xsl:text>label women nohover color-only</xsl:text>
																</xsl:when>
																<xsl:when test="tags/item/@id = '31'">
																	<xsl:text>label college nohover color-only</xsl:text>
																</xsl:when>
																<xsl:when test="tags/item/@id = '30'">
																	<xsl:text>label highschool nohover color-only</xsl:text>
																</xsl:when>
																<xsl:when test="tags/item/@id = '29'">
																	<xsl:text>label jrhigh nohover color-only</xsl:text>
																</xsl:when>
																<xsl:when test="tags/item/@id = '28'">
																	<xsl:text>label gradeschool nohover color-only</xsl:text>
																</xsl:when>
																<xsl:when test="tags/item/@id = '27'">
																	<xsl:text>label children nohover color-only</xsl:text>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:text>label allchurch nohover color-only</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:attribute>
														<xsl:choose>
															<xsl:when test="tags/item/@id = '25'">
																<xsl:text>Men's </xsl:text>
															</xsl:when>
															<xsl:when test="tags/item/@id = '26'">
																<xsl:text>Women's </xsl:text>
															</xsl:when>
															<xsl:when test="tags/item/@id = '31'">
																<xsl:text>1824 </xsl:text>
															</xsl:when>
															<xsl:when test="tags/item/@id = '30'">
																<xsl:text>High School </xsl:text>>
															</xsl:when>
															<xsl:when test="tags/item/@id = '29'">
																<xsl:text>Jr. High </xsl:text>
															</xsl:when>
															<xsl:when test="tags/item/@id = '28'">
																<xsl:text>Grade School </xsl:text>
															</xsl:when>
															<xsl:when test="tags/item/@id = '27'">
																<xsl:text>Children's </xsl:text>
															</xsl:when>
															<xsl:otherwise>
																<xsl:text>All Church </xsl:text>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:text>Event</xsl:text>
													</span>
												</xsl:otherwise>
											</xsl:choose>
										</h3>
										<div class="date">
											<xsl:choose>
												<xsl:when test="@section = 'events-recurring'"><span class="icon">r</span></xsl:when>
												<xsl:otherwise><span class="icon">t</span></xsl:otherwise>
											</xsl:choose>
											<xsl:call-template name="timespan-format">
												<xsl:with-param name="date" select="date/date" />
											</xsl:call-template>
											<xsl:value-of select="frequency" disable-output-escaping="yes" />
										</div>
										<div class="description">
											<xsl:call-template name="truncate">
												<xsl:with-param name="node">
													<xsl:call-template name="remove-html">
														<xsl:with-param name="text" select="description" />
													</xsl:call-template>
												</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="excerpt">
											<xsl:copy-of select="excerpt" disable-output-escaping="yes" />
										</div>
									</a>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'teachings'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$search-component"/>
									</xsl:call-template>
									<a>
										<xsl:call-template name="url-teachings" />
										<h3>
												<xsl:value-of select="title" disable-output-escaping="yes" />
												<span class="hyphen">—</span>
												<span class="meta">
													<xsl:value-of select="book/item" />
													<xsl:text> </xsl:text>
													<xsl:value-of select="chapter" />
												</span>
												<span class="label">Teachings</span>
										</h3>
										<div class="description">
											<xsl:call-template name="truncate">
												<xsl:with-param name="node">
													<xsl:call-template name="remove-html">
														<xsl:with-param name="text" select="description" />
													</xsl:call-template>
												</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="excerpt">
											<xsl:copy-of select="excerpt" disable-output-escaping="yes" />
										</div>
									</a>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'teachings-series'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$search-component"/>
									</xsl:call-template>
									<a>
										<xsl:call-template name="url-teachings-series" />
										<h3>
												<xsl:value-of select="title" disable-output-escaping="yes" />
												<span class="meta">
													<xsl:text> (</xsl:text>
													<xsl:value-of select="teachings/@items" />
													<xsl:text>&#160;teachings)</xsl:text>
												</span>
												<span class="label">Teaching Series</span>
										</h3>
									</a>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'teachings-tags'">
								<div>
									<xsl:call-template name="search-entry-class" />
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$search-component"/>
									</xsl:call-template>
									<a>
										<xsl:call-template name="url-teachings-tags" />
										<h3>
												<span class="icon">z</span>
												<xsl:value-of select="tag" disable-output-escaping="yes" />
												<span class="hyphen">—</span>
												<span class="meta">
													<xsl:text>Show associated teachings</xsl:text>
												</span>
												<span class="label">Teaching Tags</span>
										</h3>
									</a>
								</div>
							</xsl:when>
							<xsl:when test="@section = 'text' and string-length(//tags-all-entries/entry[@id = $tag]) &gt; 0">
								<div>
									<xsl:call-template name="search-entry-class" />
									<xsl:call-template name="edit-entry">
										<xsl:with-param name="component" select="$search-component"/>
									</xsl:call-template>
									<a>
										<xsl:call-template name="url-tags-by-text">
											<xsl:with-param name="tag" select="$tag"/>
										</xsl:call-template>
										<h3>
												<xsl:value-of select="//tags-all-entries/entry[@id = $tag]/tag" disable-output-escaping="yes" />
												<span class="label page">Page</span>
										</h3>
										<div class="description">
											<xsl:call-template name="truncate">
												<xsl:with-param name="node">
													<xsl:call-template name="remove-html">
														<xsl:with-param name="text" select="content" />
													</xsl:call-template>
												</xsl:with-param>
											</xsl:call-template>
										</div>
										<div class="excerpt">
											<xsl:copy-of select="excerpt" disable-output-escaping="yes" />
										</div>
									</a>
								</div>
							</xsl:when>
						</xsl:choose>
					</xsl:for-each>
				</div>
				<xsl:if test="$url-keywords">
					<div class="span4 filters">
						<xsl:if test="not(//search-suggestions/word = $url-keywords) and count(//search-suggestions/word) &gt; 0 or not(//alternative-keywords/keyword = $url-keywords) and count(//alternative-keywords/keyword) &gt; 0 and string-length(//alternative-keywords/keyword/@alternative)">
							<div class="suggestions">
								<xsl:if test="not(//search-suggestions/word = $url-keywords) and count(//search-suggestions/word) &gt; 0">
									<div class="suggest">
										<h4>Did you mean</h4>
										<span class="hyphen">—</span>
										<xsl:for-each select="//search-suggestions/word">
											<a href="{$root}/{$pt1}/{$pt2}/?sections={$url-sections}&amp;keywords={.}">
												<xsl:value-of select="." disable-output-escaping="yes" />
											</a>
											<xsl:if test="not(position() = last())"><xsl:text>, </xsl:text></xsl:if>
										</xsl:for-each>
									</div>
								</xsl:if>
								<xsl:if test="not(//alternative-keywords/keyword = $url-keywords) and count(//alternative-keywords/keyword) &gt; 0 and string-length(//alternative-keywords/keyword/@alternative)">
									<div class="suggest">
										<h4>Alt keywords</h4>
										<span class="hyphen">—</span>
										<xsl:for-each select="//alternative-keywords/keyword">
											<a href="{$root}/{$pt1}/{$pt2}/?sections={$url-sections}&amp;keywords={@alternative}">
												<xsl:value-of select="@alternative" disable-output-escaping="yes" />
											</a>
											<xsl:if test="not(position() = last())"><xsl:text>, </xsl:text></xsl:if>
										</xsl:for-each>
									</div>
								</xsl:if>
							</div>
						</xsl:if>
						<xsl:if test="$url-sections">
							<div class="sections">
								<p><a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}">Turn off</a> section filtering to see all results</p>
							</div>
						</xsl:if>
						<div class="filter">
							<h4>Search sections</h4>
							<div class="collection">
								<ul>
									<li>
										<xsl:if test="$url-sections = ''">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}">
											<span class="icon">J</span>
											<xsl:text> Show all</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'downloads'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=downloads">
											<span class="icon">J</span>
											<xsl:text> Downloads</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'events'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=events">
											<span class="icon">J</span>
											<xsl:text> Events</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'events-recurring'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=events-recurring">
											<span class="icon">J</span>
											<xsl:text> Bible Studies</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'text'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=text">
											<span class="icon">J</span>
											<xsl:text> Pages</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'teachings'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=teachings">
											<span class="icon">J</span>
											<xsl:text> Teachings</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'teachings-series'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=teachings-series">
											<span class="icon">J</span>
											<xsl:text> Teaching Series</xsl:text>
										</a>
									</li>
									<li>
										<xsl:if test="$url-sections = 'teachings-tags'">
											<xsl:attribute name="class">
												<xsl:text>active</xsl:text>
											</xsl:attribute>
										</xsl:if>
										<a href="{$root}/{$pt1}/{$pt2}/?keywords={$url-keywords}&amp;sections=teachings-tags">
											<span class="icon">J</span>
											<xsl:text> Teaching Tags</xsl:text>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</xsl:if>
			</div>
		</div>
		<xsl:call-template name="pagination-search">
			<xsl:with-param name="pagination" select="$entries/../pagination" />
		</xsl:call-template>
	</div>

</xsl:template>


<xsl:template name="search-entry-class">

	<xsl:call-template name="class-rows">
		<xsl:with-param name="class">
			<xsl:text>type-</xsl:text>
			<xsl:value-of select="@section" disable-output-escaping="yes" />
		</xsl:with-param>
	</xsl:call-template>

</xsl:template>


<xsl:template name="pagination-search">

	<xsl:param name="pagination" />

	<xsl:call-template name="cd-pagination">
		<xsl:with-param name="pagination" select="$pagination" />
		<xsl:with-param name="pagination-url">
			<xsl:value-of select="$root" />
			<xsl:text>/</xsl:text>
			<xsl:value-of select="$pt1" />
			<xsl:text>/</xsl:text>
			<xsl:value-of select="$pt2" />
			<xsl:text>/?</xsl:text>
			<xsl:if test="$url-keywords">
				<xsl:text>&amp;keywords=</xsl:text>
				<xsl:value-of select="$url-keywords" />
			</xsl:if>
			<xsl:if test="$url-sections">
				<xsl:text>&amp;sections=</xsl:text>
				<xsl:value-of select="$url-sections" />
			</xsl:if>
			<xsl:text>&amp;page=</xsl:text>
			<xsl:value-of select="'$'" />
		</xsl:with-param>
	</xsl:call-template>

</xsl:template>


</xsl:stylesheet>
