<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<xsl:template name="component-events">

	<xsl:param name="entries" />
	<xsl:param name="position" />
	<xsl:param name="single" />

	<xsl:variable name="data-source" select="name($entries/../.)" />
	<xsl:variable name="is-recurring">
		<xsl:choose>
			<xsl:when test="substring($data-source, 1, 16) = 'events-recurring'">
				<xsl:value-of select="'Yes'" disable-output-escaping="yes" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'No'" disable-output-escaping="yes" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="component">
		<xsl:choose>
			<xsl:when test="$is-recurring = 'Yes'">
				<xsl:value-of select="'events-recurring'" disable-output-escaping="yes" />
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="'events'" disable-output-escaping="yes" />
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>

	<xsl:if test="count($entries)">
		<div>
			<xsl:choose>
				<xsl:when test="$position = 'column-right'">
					<xsl:call-template name="class-position">
						<xsl:with-param name="component" select="$component" />
					</xsl:call-template>
					<h3>
						<xsl:choose>
							<xsl:when test="$is-recurring = 'Yes'">
								<xsl:text disable-output-escaping="yes">Bible Studies</xsl:text>
							</xsl:when>
							<xsl:otherwise>
								<xsl:text disable-output-escaping="yes">Upcoming Events</xsl:text>
							</xsl:otherwise>
						</xsl:choose>
					</h3>
					<ul class="entries">
						<xsl:choose>
							<xsl:when test="$is-recurring = 'No'">
								<xsl:for-each select="$entries[ position() &lt; 4 ]">
									<xsl:call-template name="events-entry-column-right">
										<xsl:with-param name="component" select="$component" />
										<xsl:with-param name="is-recurring" select="$is-recurring" />
									</xsl:call-template>
								</xsl:for-each>
							</xsl:when>
							<xsl:otherwise>
								<xsl:for-each select="$entries">
									<xsl:call-template name="events-entry-column-right">
										<xsl:with-param name="component" select="$component" />
										<xsl:with-param name="is-recurring" select="$is-recurring" />
									</xsl:call-template>
								</xsl:for-each>
							</xsl:otherwise>
						</xsl:choose>
						<xsl:if test="$is-recurring = 'No'">
							<a class="more">
								<xsl:call-template name="url-events-home" />
								<span class="icon">l</span>
								<span>See more events</span>
							</a>
						</xsl:if>
					</ul>
				</xsl:when>
				<xsl:when test="$position = 'column-full-width'">
					<xsl:attribute name="class">row</xsl:attribute>
					<div>
						<xsl:variable name="class">
							<xsl:if test="not($single)">
								<xsl:text disable-output-escaping="yes">span8</xsl:text>
							</xsl:if>
						</xsl:variable>
						<xsl:call-template name="class-position">
							<xsl:with-param name="component">events</xsl:with-param>
							<xsl:with-param name="class" select="$class" />
						</xsl:call-template>
						<xsl:if test="$is-recurring = 'Yes'">
							<xsl:attribute name="class">
								<xsl:text>component component-events recurring</xsl:text>
							</xsl:attribute>
						</xsl:if>
						<div class="component-header">
							<xsl:if test="$pt2 = 'events' and $pt5 = 'past'">
								<div class="back">
									<a class="link-small">
										<xsl:call-template name="url-events-home" />
										<xsl:text>Show current events &#8594;</xsl:text>
									</a>
								</div>
							</xsl:if>
							<xsl:if test="not($single)">
								<h3>Upcoming Events</h3>
							</xsl:if>
						</div>
						<div class="entries">
							<xsl:for-each select="$entries">
								<xsl:variable name="is-earlier">
									<xsl:call-template name="date-compare">
										<xsl:with-param name="first" select="date/date/start" />
										<xsl:with-param name="second" select="$today" />
									</xsl:call-template>
								</xsl:variable>

								<xsl:if test="$single and $is-recurring">
									<xsl:choose>
										<xsl:when test="images/item">
											<xsl:call-template name="component-images">
												<xsl:with-param name="position" select="'column-full-width'"/>
												<xsl:with-param name="entries" select="images/item" />
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<div>
												<xsl:attribute name="class">
													<xsl:choose>
														<xsl:when test="tags/item/@id = '25'">
															<xsl:text>outer men nohover</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '26'">
															<xsl:text>outer women nohover</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '31'">
															<xsl:text>outer college nohover</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '30'">
															<xsl:text>outer highschool nohover</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '29'">
															<xsl:text>outer jrhigh nohover</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '28'">
															<xsl:text>outer gradeschool nohover</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '27'">
															<xsl:text>outer children nohover</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text>outer allchurch nohover</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
												<div class="container flier">
													<div class="row">
														<hr class="divider top" />
														<h3>
															<span>
																<xsl:attribute name="class">
																	<xsl:choose>
																		<xsl:when test="tags/item/@id = '25'">
																			<xsl:text>men nohover color-only top</xsl:text>
																		</xsl:when>
																		<xsl:when test="tags/item/@id = '26'">
																			<xsl:text>women nohover color-only top</xsl:text>
																		</xsl:when>
																		<xsl:when test="tags/item/@id = '31'">
																			<xsl:text>college nohover color-only top</xsl:text>
																		</xsl:when>
																		<xsl:when test="tags/item/@id = '30'">
																			<xsl:text>highschool nohover color-only top</xsl:text>
																		</xsl:when>
																		<xsl:when test="tags/item/@id = '29'">
																			<xsl:text>jrhigh nohover color-only top</xsl:text>
																		</xsl:when>
																		<xsl:when test="tags/item/@id = '28'">
																			<xsl:text>gradeschool nohover color-only top</xsl:text>
																		</xsl:when>
																		<xsl:when test="tags/item/@id = '27'">
																			<xsl:text>children nohover color-only top</xsl:text>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:text>allchurch nohover color-only top</xsl:text>
																		</xsl:otherwise>
																	</xsl:choose>
																</xsl:attribute>
																<xsl:choose>
																	<xsl:when test="tags/item/@id = '25'">
																		<span><xsl:text>Men</xsl:text><span class="hidden-phone">'s Ministry</span></span>
																	</xsl:when>
																	<xsl:when test="tags/item/@id = '26'">
																		<span><xsl:text>Women</xsl:text><span class="hidden-phone">'s Ministry</span></span>
																	</xsl:when>
																	<xsl:when test="tags/item/@id = '31'">
																		<span><xsl:text>1824</xsl:text><span class="hidden-phone"> Ministry</span></span>
																	</xsl:when>
																	<xsl:when test="tags/item/@id = '30'">
																		<span><xsl:text>High School</xsl:text><span class="hidden-phone"> Ministry</span></span>
																	</xsl:when>
																	<xsl:when test="tags/item/@id = '29'">
																		<span><xsl:text>Jr. High</xsl:text><span class="hidden-phone"> Ministry</span></span>
																	</xsl:when>
																	<xsl:when test="tags/item/@id = '28'">
																		<span><xsl:text>Grade School</xsl:text><span class="hidden-phone"> Ministry</span></span>
																	</xsl:when>
																	<xsl:when test="tags/item/@id = '27'">
																		<span><xsl:text>Children's</xsl:text><span class="hidden-phone"> Ministry</span></span>
																	</xsl:when>
																	<xsl:otherwise>
																		<span><xsl:text>All Church</xsl:text></span>
																	</xsl:otherwise>
																</xsl:choose>
															</span>
														</h3>
														<h1>
															<span>
																<xsl:value-of select="name" disable-output-escaping="yes" />
															</span>
														</h1>
														<h3>
															<span>
																<xsl:attribute name="class">
																	<xsl:choose>
																		<xsl:when test="tags/item/@id = '25'">
																			<xsl:text>men nohover color-only bottom</xsl:text>
																		</xsl:when>
																		<xsl:when test="tags/item/@id = '26'">
																			<xsl:text>women nohover color-only bottom</xsl:text>
																		</xsl:when>
																		<xsl:when test="tags/item/@id = '31'">
																			<xsl:text>college nohover color-only bottom</xsl:text>
																		</xsl:when>
																		<xsl:when test="tags/item/@id = '30'">
																			<xsl:text>highschool nohover color-only bottom</xsl:text>
																		</xsl:when>
																		<xsl:when test="tags/item/@id = '29'">
																			<xsl:text>jrhigh nohover color-only bottom</xsl:text>
																		</xsl:when>
																		<xsl:when test="tags/item/@id = '28'">
																			<xsl:text>gradeschool nohover color-only bottom</xsl:text>
																		</xsl:when>
																		<xsl:when test="tags/item/@id = '27'">
																			<xsl:text>children nohover color-only bottom</xsl:text>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:text>allchurch nohover color-only bottom</xsl:text>
																		</xsl:otherwise>
																	</xsl:choose>
																</xsl:attribute>
																<xsl:choose>
																	<xsl:when test="$is-recurring = 'No'">
																		<xsl:call-template name="format-date">
																			<xsl:with-param name="date" select="date/date/start/@iso" />
																			<xsl:with-param name="format" select="'%m+; %d;%ds;, %y+;'" />
																		</xsl:call-template>
																	</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select="frequency" disable-output-escaping="yes" />
																	</xsl:otherwise>
																</xsl:choose>
															</span>
														</h3>
														<hr class="divider bottom" />
													</div>
												</div>
											</div>
											<div class="padder static">
												<xsl:choose>
													<xsl:when test="string-length(name) &lt;= '20'">
														<xsl:attribute name="class">
															<xsl:text>padder static small</xsl:text>
														</xsl:attribute>
													</xsl:when>
													<xsl:otherwise>
														<xsl:attribute name="class">
															<xsl:text>padder static</xsl:text>
														</xsl:attribute>
													</xsl:otherwise>
												</xsl:choose>
												<xsl:text>&#160;</xsl:text>
											</div>
										</xsl:otherwise>
									</xsl:choose>
									<xsl:call-template name="component-verses">
										<xsl:with-param name="position" select="'column-full-width'" />
										<xsl:with-param name="entries" select="verses/item" />
									</xsl:call-template>
								</xsl:if>

								<div>
									<xsl:choose>
										<xsl:when test="$single">
											<xsl:call-template name="class-rows">
												<xsl:with-param name="class" select="'entries span8'" />
											</xsl:call-template>
										</xsl:when>
										<xsl:otherwise>
											<xsl:call-template name="class-rows" />
										</xsl:otherwise>
									</xsl:choose>
									<xsl:if test="$is-earlier &lt; 0">
										<xsl:text> </xsl:text>
										<div class="label label-warning">This occured in the past</div>
									</xsl:if>

									<div class="events-header">
										<h2 class="header">
											<xsl:choose>
												<xsl:when test="$single">
													<xsl:value-of select="name" disable-output-escaping="yes" />
												</xsl:when>
												<xsl:otherwise>
													<a>
														<xsl:call-template name="url-events" />
														<xsl:value-of select="name" disable-output-escaping="yes" />
													</a>
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
																	<xsl:text>label allchurch color-only</xsl:text>
																</xsl:otherwise>
															</xsl:choose>
														</xsl:attribute>
														<xsl:choose>
															<xsl:when test="tags/item/@id = '25'">
																<span><xsl:text>Men</xsl:text><span class="hidden-phone">'s Ministry</span></span>
															</xsl:when>
															<xsl:when test="tags/item/@id = '26'">
																<span><xsl:text>Women</xsl:text><span class="hidden-phone">'s Ministry</span></span>
															</xsl:when>
															<xsl:when test="tags/item/@id = '31'">
																<span><xsl:text>1824</xsl:text><span class="hidden-phone"> Ministry</span></span>
															</xsl:when>
															<xsl:when test="tags/item/@id = '30'">
																<span><xsl:text>High School</xsl:text><span class="hidden-phone"> Ministry</span></span>
															</xsl:when>
															<xsl:when test="tags/item/@id = '29'">
																<span><xsl:text>Jr. High</xsl:text><span class="hidden-phone"> Ministry</span></span>
															</xsl:when>
															<xsl:when test="tags/item/@id = '28'">
																<span><xsl:text>Grade School</xsl:text><span class="hidden-phone"> Ministry</span></span>
															</xsl:when>
															<xsl:when test="tags/item/@id = '27'">
																<span><xsl:text>Children's</xsl:text><span class="hidden-phone"> Ministry</span></span>
															</xsl:when>
															<xsl:otherwise>
																<span><xsl:text>All Church</xsl:text></span>
															</xsl:otherwise>
														</xsl:choose>
													</span>
												</xsl:otherwise>
											</xsl:choose>
											<xsl:call-template name="edit-entry">
												<xsl:with-param name="component" select="$component"/>
											</xsl:call-template>
										</h2>
										<div class="date clearfix">
											<xsl:choose>
												<xsl:when test="$is-recurring = 'No'">
													<span class="icon">t</span>
													<xsl:call-template name="timespan-format">
														<xsl:with-param name="date" select="date/date" />
													</xsl:call-template>
												</xsl:when>
												<xsl:otherwise>
													<span class="icon">r</span>
													<xsl:value-of select="frequency" disable-output-escaping="yes" />
												</xsl:otherwise>
											</xsl:choose>
										</div>
									</div>
									<div class="description">
										<xsl:choose>
											<xsl:when test="$single">
												<xsl:value-of select="description" disable-output-escaping="yes" />
											</xsl:when>
											<xsl:otherwise>
												<xsl:variable name="stripped">
													<xsl:call-template name="remove-html">
														<xsl:with-param name="text" select="description" />
													</xsl:call-template>
												</xsl:variable>
												<xsl:call-template name="truncate">
													<xsl:with-param name="node" select="$stripped" />
													<xsl:with-param name="length" select="236" />
												</xsl:call-template>
											</xsl:otherwise>
										</xsl:choose>
									</div>
								</div>
								<xsl:if test="$single">
									<div class="span4 column-right">
										<xsl:call-template name="component-locations">
											<xsl:with-param name="position" select="'column-right'" />
											<xsl:with-param name="entries" select="locations/item" />
										</xsl:call-template>
										<xsl:call-template name="component-members-roles">
											<xsl:with-param name="position" select="'column-right'" />
											<xsl:with-param name="entries" select="member-role/item" />
										</xsl:call-template>
										<xsl:call-template name="component-downloads">
											<xsl:with-param name="position" select="'column-right'" />
											<xsl:with-param name="entries" select="downloads/item" />
										</xsl:call-template>
										<div>
											<h3>Share</h3>
											<div class="input-append" style="width:100%;">
											  <input type="text" name="permalink" value="http://accf.co/{$pt3}" onclick="this.select()" />
											  <span class="add-on">
											  	<a class="tweet">
												  	<xsl:attribute name="href">
															<xsl:text>http://twitter.com/intent/tweet?text=</xsl:text>
															  <xsl:if test="string-length(name) &gt; 1">
															    <xsl:call-template name="url-encode">
															      <xsl:with-param name="str" select="name"/>
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
									</div>
								</xsl:if>
							</xsl:for-each>
						</div>
						<xsl:if test="$pt2 = 'events'">
							<xsl:call-template name="events-pagination">
								<xsl:with-param name="entries" select="$entries" />
							</xsl:call-template>
							<xsl:if test="$single">
								<div class="component-footer">
									<div class="back">
										<a class="link-small">
											<xsl:call-template name="url-events-home" />
											<xsl:text>&#8592; Back to all events</xsl:text>
										</a>
									</div>
								</div>
							</xsl:if>
						</xsl:if>
					</div>
					<xsl:if test="$position = 'column-full-width' and not($single)">
						<div class="span4 column-right">
							<div class="component component-events-recurring">
								<h3>Bible Studies</h3>
								<ul>
									<xsl:for-each select="//events-recurring-all-entries-filtered/entry [type/item/type/@handle = 'church-wide']">
										<xsl:call-template name="events-entry-column-right">
											<xsl:with-param name="component" select="$component" />
											<xsl:with-param name="is-recurring" select="'Yes'" />
										</xsl:call-template>
									</xsl:for-each>
								</ul>
							</div>
						</div>
					</xsl:if>
				</xsl:when>
				<xsl:when test="$position = 'column-home'">
					<xsl:call-template name="class-position">
						<xsl:with-param name="component" select="$component" />
					</xsl:call-template>
					<h3 class="title-row">Upcoming Events <a href="/20/events" class="pull-right hidden-phone">See More Events</a></h3>
					<div class="row">
						<xsl:for-each select="$entries[ position() &lt; 4 ]">
							<div>
								<xsl:choose>
									<xsl:when test="count($entries) &lt;3">
										<xsl:choose>
											<xsl:when test="count($entries) &lt;2">
												<xsl:attribute name="class">
													<xsl:choose>
														<xsl:when test="tags/item/@id = '25'">
															<xsl:text>span6 offset3 men</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '26'">
															<xsl:text>span6 offset3 women</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '31'">
															<xsl:text>span6 offset3 college</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '30'">
															<xsl:text>span6 offset3 highschool</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '29'">
															<xsl:text>span6 offset3 jrhigh</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '28'">
															<xsl:text>span6 offset3 gradeschool</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '27'">
															<xsl:text>span6 offset3 children</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text>span6 offset3 allchurch</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="class">
													<xsl:choose>
														<xsl:when test="tags/item/@id = '25'">
															<xsl:text>span6 men</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '26'">
															<xsl:text>span6 women</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '31'">
															<xsl:text>span6 college</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '30'">
															<xsl:text>span6 highschool</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '29'">
															<xsl:text>span6 jrhigh</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '28'">
															<xsl:text>span6 gradeschool</xsl:text>
														</xsl:when>
														<xsl:when test="tags/item/@id = '27'">
															<xsl:text>span6 children</xsl:text>
														</xsl:when>
														<xsl:otherwise>
															<xsl:text>span6 allchurch</xsl:text>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:when>
									<xsl:otherwise>
										<xsl:attribute name="class">
											<xsl:choose>
												<xsl:when test="tags/item/@id = '25'">
													<xsl:text>span4 men</xsl:text>
												</xsl:when>
												<xsl:when test="tags/item/@id = '26'">
													<xsl:text>span4 women</xsl:text>
												</xsl:when>
												<xsl:when test="tags/item/@id = '31'">
													<xsl:text>span4 college</xsl:text>
												</xsl:when>
												<xsl:when test="tags/item/@id = '30'">
													<xsl:text>span4 highschool</xsl:text>
												</xsl:when>
												<xsl:when test="tags/item/@id = '29'">
													<xsl:text>span4 jrhigh</xsl:text>
												</xsl:when>
												<xsl:when test="tags/item/@id = '28'">
													<xsl:text>span4 gradeschool</xsl:text>
												</xsl:when>
												<xsl:when test="tags/item/@id = '27'">
													<xsl:text>span4 children</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:text>span4 allchurch</xsl:text>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
									</xsl:otherwise>
								</xsl:choose>
								<a>
									<xsl:call-template name="url-events" />
									<h4 class="date">
										<span>
											<xsl:call-template name="format-date">
												<xsl:with-param name="date" select="date/date/start/@iso" />
												<xsl:with-param name="format" select="'%m+; %d;%ds;, %y+;'" />
											</xsl:call-template>
										</span>
									</h4>
									<hr class="divider" />
									<h3>
										<span>
											<xsl:value-of select="name" disable-output-escaping="yes" />
										</span>
									</h3>
									<hr class="divider" />
									<h4 class="ministry">
										<xsl:choose>
											<xsl:when test="tags/item/@id = '25'">
												<span><xsl:text>Men's Ministry</xsl:text></span>
											</xsl:when>
											<xsl:when test="tags/item/@id = '26'">
												<span><xsl:text>Women's Ministry</xsl:text></span>
											</xsl:when>
											<xsl:when test="tags/item/@id = '31'">
												<span><xsl:text>1824 Ministry</xsl:text></span>
											</xsl:when>
											<xsl:when test="tags/item/@id = '30'">
												<span><xsl:text>High School Ministry</xsl:text></span>
											</xsl:when>
											<xsl:when test="tags/item/@id = '29'">
												<span><xsl:text>Jr. High Ministry</xsl:text></span>
											</xsl:when>
											<xsl:when test="tags/item/@id = '28'">
												<span><xsl:text>Grade School Ministry</xsl:text></span>
											</xsl:when>
											<xsl:when test="tags/item/@id = '27'">
												<span><xsl:text>Children's Ministry</xsl:text></span>
											</xsl:when>
											<xsl:otherwise>
												<span><xsl:text>All Church</xsl:text></span>
											</xsl:otherwise>
										</xsl:choose>
									</h4>
								</a>
							</div>
						</xsl:for-each>
					</div>
					<div class="center visible-phone">
						<a href="/20/events" class="link-big inline">See More Events</a>
					</div>
				</xsl:when>
			</xsl:choose>
		</div>
	</xsl:if>

</xsl:template>


<xsl:template name="events-entry-column-right">

	<xsl:param name="component" />
	<xsl:param name="is-recurring" />
	<li class="clearfix">
		<xsl:call-template name="class-rows" />
		<a>
			<xsl:call-template name="url-events" />
			<xsl:choose>
				<xsl:when test="$is-recurring = 'No'">
					<div class="date">
						<div class="month">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start/@iso" />
								<xsl:with-param name="format" select="'%m-;'" />
							</xsl:call-template>
						</div>
						<div class="day">
							<xsl:call-template name="format-date">
								<xsl:with-param name="date" select="date/date/start/@iso" />
								<xsl:with-param name="format" select="'%d;'" />
							</xsl:call-template>
						</div>
					</div>
					<table class="info">
						<tr>
							<td>
								<xsl:value-of select="name" disable-output-escaping="yes" />
							</td>
						</tr>
					</table>
				</xsl:when>
				<xsl:otherwise>
				    <div class="title">
						<xsl:value-of select="name" disable-output-escaping="yes" />
					</div>
					<div class="frequency">
						<xsl:value-of select="frequency" disable-output-escaping="yes" />
					</div>
					<div class="location">
						<xsl:call-template name="location-name" />
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</a>
		<xsl:call-template name="edit-entry">
			<xsl:with-param name="component" select="$component"/>
		</xsl:call-template>
	</li>

</xsl:template>


<xsl:template name="events-pagination">

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
					<xsl:value-of select="'$'" /><xsl:text>/</xsl:text>
				</xsl:if>
				<xsl:if test="$pt4">
					<xsl:value-of select="$pt4" /><xsl:text>/</xsl:text>
				</xsl:if>
				<xsl:if test="$pt5">
					<xsl:value-of select="$pt5" /><xsl:text>/</xsl:text>
				</xsl:if>
			</xsl:with-param>
		</xsl:call-template>

</xsl:template>


</xsl:stylesheet>