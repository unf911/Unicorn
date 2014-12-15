<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="windows-1251"  />

<xsl:variable name="T1" select="//*[substring(name(),1,2)='T1']" />
<xsl:key name="grT1" match="//*[substring(name(),1,2)='T1']" use="@ROWNUM"/>
<xsl:variable name="T2" select="//*[substring(name(),1,2)='T2']" />
<xsl:key name="grT2" match="//*[substring(name(),1,2)='T2']" use="@ROWNUM"/>

<xsl:template match="DECLAR">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251"></meta>
<title> J1201507 - Реєстр  виданих та отриманих податкових накладних  (Наказ Міністерства доходів і зборів України 25 листопада 2013 року № 708)</title>
<link HREF="./css/xsl_edit_styles.css" REL="stylesheet" />
<script SRC="./PrepareEditDoc.js" > </script>
</head>
					<body>
<table BORDER="0" width="100%" class="td_box">
	<tr >
	  <td>  <font color="red"> * </font >  Поля обов'язкові для заповнення. </td>
	</tr>
      </table>
<br />
						<table width="100%" border="0" cellspacing="0" cellpadding="1">
							<col width="100%"/>
							<tr>
								<td width="56%" align="center">
									<p align="center">
										<span class="large">      </span>
									</p>
									<span class="large">
										<h2> </h2>
									</span>
								</td>
								<td width="44%" align="center">
									<p align="center">ЗАТВЕРДЖЕНО<br/>           Наказ Міністерства доходів і зборів України <br/>25 листопада 2013 року № 708    </p> </td>
							</tr>
						</table>
						<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#000000">
						<col width="100%"/>
							<tr>
								<td width="3%" rowspan="3" align="center"> <b>O1 </b></td>
								<td width="60%" align="center" rowspan="3">
									<h1>
										<strong>Реєстр виданих та отриманих податкових накладних </strong>
									</h1>
								</td>
								<td width="15%" rowspan="3">подається до декларації з податку на додану вартість </td>
							 				 <td Width="5%" align="center">O11<font color="red"> * </font ></td>
										 <td width="5%">
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='HZ']" /></xsl:attribute>
										<xsl:attribute name="id" >HZ</xsl:attribute>
										<xsl:attribute name="size">12</xsl:attribute>
										<xsl:attribute name="position">0</xsl:attribute>
										<xsl:attribute name="addType">DGchk</xsl:attribute>
										<xsl:attribute name="valueType">integer</xsl:attribute>
										<xsl:attribute name="style">text-align:left;</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
										<td width="25%">Звітної</td>
									</tr>
									<tr>
								 										 <td align="center">O12<font color="red"> * </font ></td>
										 <td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='HZN']" /></xsl:attribute>
										<xsl:attribute name="id" >HZN</xsl:attribute>
										<xsl:attribute name="size">12</xsl:attribute>
										<xsl:attribute name="position">0</xsl:attribute>
										<xsl:attribute name="addType">DGchk</xsl:attribute>
										<xsl:attribute name="valueType">integer</xsl:attribute>
										<xsl:attribute name="style">text-align:left;</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
										<td>Звітної нової</td>
									</tr><tr>
																			 <td align="center">O13<font color="red"> * </font ></td>
										 <td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='HNP']" /></xsl:attribute>
										<xsl:attribute name="id" >HNP</xsl:attribute>
										<xsl:attribute name="size">12</xsl:attribute>
										<xsl:attribute name="position">0</xsl:attribute>
										<xsl:attribute name="addType">DGI2inom</xsl:attribute>
										<xsl:attribute name="valueType">unsignedLong</xsl:attribute>
										<xsl:attribute name="style">text-align:left;</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
										<td>Номер порції реєстру</td>

							</tr>
						</table>
					 <br />
					 <table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#000000">
						<tr>
								<td align="center" width="3%"><b>O2</b></td>
								<td align="center" colspan="2">Відмітка про подання декларації з податку на додану вартість за формою  </td>
						</tr>
							<tr>
								<td align="center" width="3%">O21</td>
								<td align="center" width="5%"> X </td>
								<td  width="80%">(0110) загальна  </td>
              </tr>
							 <tr>
								<td align="center" >O22</td>
								<td align="center" ><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>   </td>
								<td  width="80%">(0121-0123) спеціальний режим оподаткування діяльності у сфері сільського та лісового господарства, а також рибальства
(стаття 209 Податкового кодексу України) </td>
              </tr>
							  <tr>
								<td align="center" >O23</td>
								<td align="center" ><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>  </td>
								<td  width="80%">(0130) сільськогосподарське підприємство, яке не обрало спеціальний режим оподаткування (пункт 209.18 статті 209
розділу V Податкового кодексу України) </td>
              </tr>
								 <tr>
								<td align="center" >O24</td>
								<td align="center" ><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>   </td>
								<td  width="80%">(0140) спеціальний режим оподаткування  переробного підприємства (пункт 1 підрозділу 2 розділу ХХ Податкового кодексу України)</td>
              </tr>
					 </table>
						 <br />
					  <table width="60%" border="1" cellpadding="1" cellspacing="0" bordercolor="#000000">
						<tr>
								<td align="center" width="5%" rowspan="2"><b>O3</b><font color="red"> * </font ></td>
								<td rowspan="2">Звітний (податковий) період </td>

               <td width="10%">
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='HZY']" /></xsl:attribute>
										<xsl:attribute name="id">HZY</xsl:attribute>
										<xsl:attribute name="size">6</xsl:attribute>
										<xsl:attribute name="position">1</xsl:attribute>
										<xsl:attribute name="addType">DGYear</xsl:attribute>
										<xsl:attribute name="valueType">integer</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">0</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>

									</xsl:element>
								</td>

								<td width="3%" align="center"/>
								<td  width="10%">
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='HZM']" /></xsl:attribute>
										<xsl:attribute name="id">HZM</xsl:attribute>
										<xsl:attribute name="size">4</xsl:attribute>
										<xsl:attribute name="position">2</xsl:attribute>
										<xsl:attribute name="addType">DGMonth</xsl:attribute>
										<xsl:attribute name="valueType">integer</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">0</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>

									  <td width="3%" align="center"> </td>
								<td  width="10%">
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='HKV']" /></xsl:attribute>
										<xsl:attribute name="id">HKV</xsl:attribute>
										<xsl:attribute name="size">3</xsl:attribute>
										<xsl:attribute name="position">2</xsl:attribute>
										<xsl:attribute name="addType">DGchk</xsl:attribute>
										<xsl:attribute name="valueType">integer</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">0</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>

															</tr>
							<tr align="center">
							  <td align="center">(рік)</td>
								<td align="center"/>
								<td align="center">(місяць)</td>
								<td align="center"/>
								<td align="center">(ознака квартального звітування)</td>
								</tr>
						</table>
						 <br />
					 <table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#000000">
						<tr>
								<td align="center" width="3%" rowspan="2"><b>O4</b><font color="red"> * </font ></td>
								<td width="10%" rowspan="2">Платник</td>

                <td  align="left" width="80%">
									<xsl:element name="input" >
										<xsl:attribute name="value" ><xsl:value-of select="//DECLARBODY/*[name()='HNAME']"   /></xsl:attribute>
										<xsl:attribute name="id">HNAME</xsl:attribute>
										<xsl:attribute name="size">50</xsl:attribute>
										<xsl:attribute name="position">4</xsl:attribute>
										<xsl:attribute name="addType">DGHNAME</xsl:attribute>
										<xsl:attribute name="valueType">string</xsl:attribute>
										<xsl:attribute name="style">text-align:left; width=100%;</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
							</tr>
							<tr align="center">
							  <td align="center"><font size="-1">(найменування - для юридичної особи та постійного представництва нерезидента; прізвище, ім'я, по батькові -
для фізичної особи-підприємця; найменування, дата та номер договору - для спільної  діяльності; найменування, дата та номер договору - для особи-управителя майном;
найменування, дата та номер угоди про розподіл продукції - для інвестора (оператора), який веде окремий податковий облік, пов'язаний з виконанням угоди про розподіл продукції) </font></td>
								</tr>
						</table>
							 <br />
						<table width="60%" border="1" cellpadding="1" cellspacing="0" bordercolor="#000000">
						<tr>
								<td align="center" width="3%" ><b>O5</b><font color="red"> * </font ></td>
								<td width="30%" >Індивідуальний податковий номер платника податку на додану вартість</td>

                <td  align="left" width="20%">
									<xsl:element name="input" >
										<xsl:attribute name="value" ><xsl:value-of select="//DECLARBODY/*[name()='HNPDV']"   /></xsl:attribute>
										<xsl:attribute name="id">HNPDV</xsl:attribute>
										<xsl:attribute name="size">50</xsl:attribute>
										<xsl:attribute name="position">4</xsl:attribute>
										<xsl:attribute name="addType">DGHIPN</xsl:attribute>
										<xsl:attribute name="valueType">string</xsl:attribute>
										<xsl:attribute name="style">text-align:left;</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
							</tr>
						 		</table>
										<br />
						  <table width="60%" border="1" cellpadding="1" cellspacing="0" bordercolor="#000000">
						<tr>
								<td align="center" width="3%" ><b>O6</b><font color="red"> * </font ></td>
								<td width="30%" >Номер свідоцтва про реєстрацію платника податку на додану вартість</td>

                <td  align="left" width="20%">
									<xsl:element name="input" >
										<xsl:attribute name="value" ><xsl:value-of select="//DECLARBODY/*[name()='HNSPDV']"   /></xsl:attribute>
										<xsl:attribute name="id">HNSPDV</xsl:attribute>
										<xsl:attribute name="size">50</xsl:attribute>
										<xsl:attribute name="position">4</xsl:attribute>
										<xsl:attribute name="addType">DGHNSPDV</xsl:attribute>
										<xsl:attribute name="valueType">string</xsl:attribute>
										<xsl:attribute name="style">text-align:left;</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
							</tr>
						 		</table>
						 <br />
					<table>
							<tr>
								<td align="left">
									<strong>Розділ I. Видані податкові  накладні</strong>
								</td>
							</tr>
						</table>
						<table width="100%" border="1" cellpadding="1" cellspacing="0" bordercolor="#000000">
							<tr>
								<td rowspan="4" align="center">
									№<br/>з/п<br />Початковий номер <br />
									<xsl:element name="input" >
										<xsl:attribute name="value" >
											<xsl:choose>
												<xsl:when test="count(//DECLARBODY/T1RXXXXG1)=0">
													<xsl:text>1</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="string(//DECLARBODY/T1RXXXXG1[@ROWNUM=1])"   />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<xsl:attribute name="id">PNUM</xsl:attribute>
										<xsl:attribute name="size">50</xsl:attribute>
										<xsl:attribute name="position">4</xsl:attribute>
										<xsl:attribute name="valueType">string</xsl:attribute>
										<xsl:attribute name="style">text-align:right; width:80%;</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td colspan="8" align="center">Податкова накладна, розрахунок коригування кількісних та вартісних показників до податкової накладної, митна декларація,
 документ бухгалтерського обліку</td>
								<td rowspan="4" align="center">Загальна сума постачання, включаючи податок на додану вартість</td>
								<td colspan="4" align="center">Постачання товарів /послуг та послуги, надані нерезидентом на митній території України, які:</td>
								<td rowspan="4" align="center">Вивезення  товарів за межі митної території України (база оподаткування) </td>
								<td rowspan="4" align="center">Постачання послуг за межами митної території України та послуг, місце постачання яких визначено
за межами митної території України  </td>
							</tr>
							<tr>
								<td rowspan="3" align="center">дата складання </td>
								<td rowspan="3" align="center">порядковий номер (реєстраційний номер - для митної декларації)</td>
								<td rowspan="3" align="center">Позначка "7", яка вказує що ПН (РК) складена на операції, які оподат-ковуються за ставкою 7 %</td>
								<td rowspan="3" colspan="3" align="center">вид документа<font color="blue"> ** </font ></td>
								<td colspan="2" align="center">платник податку-покупець</td>
								<td colspan="3" align="center">підлягають оподаткуванню  за ставкою </td>
								<td rowspan="3" align="center">звільнені від  оподаткування, не є об'єктами оподаткування (сума постачання) </td>
							</tr>
							<tr>
								<td rowspan="2" align="center">
									<span class="style4">найменування <br/>(П.І.Б. - для фізичної особи-підприємця)</span>
								</td>
								<td rowspan="2" align="center">
									<span class="style4">індивіду- альний податковий  номер</span>
								</td>
								<td colspan="2" align="center">20%</td>
								<td align="center">0%</td>
							</tr>
							<tr>
								<td align="center">база оподаткування </td>
								<td align="center">сума податку на додану вартість</td>
								<td align="center">база оподаткування</td>
							</tr>
						<tbody id="Process">
             	<tr>
								<td width="2%" align="center">1</td>
								<td width="3%" align="center">2</td>
								<td width="3%" align="center" >3</td>
								<td width="3%" align="center" >3a</td>
								<td align="center" colspan="3">4</td>
								<td align="center">5</td>
								<td width="6%" align="center">6</td>
								<td width="10%" align="center">7</td>
								<td width="10%" align="center">8</td>
								<td width="10%" align="center">9</td>
								<td width="10%" align="center">10</td>
								<td width="10%" align="center">11</td>
								<td width="10%" align="center">12</td>
							  <td width="10%" align="center">13</td>
							</tr>
 	<!--Output Table-->
    <xsl:choose>
		<xsl:when  test="count($T1)=0">
				<tr align="center" id="StretchTable" rownum="1">
					<td>
						<span id="spRownum">
							<input type="textbox" id="T1RXXXXG1" value="" ROWNUM="1" size="6"
							position="10" addType="IntColumn" valueType="xs:integer" style="text-align:right;"
							onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();"
							onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
						</span>
					</td>
					<td><input type="textbox" id="T1RXXXXG2D" value="" ROWNUM="1"
									 size="10" position="45" addType="DateColumn" valueType="date" style="text-align:center;"
									 onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T1RXXXXG3S" value="" ROWNUM="1"
									size="10" position="46" addType="StrColumn" valueType="string" style="text-align:left;"
									onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T1RXXXXG31" value="" ROWNUM="1"
									size="10" position="46" addType="I2inomColumn" valueType="int" style="text-align:center;"
									onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td width="2%"><input type="textbox" id="T1RXXXXG41S" value="" ROWNUM="1"
									size="4" position="47" addType="DGKodTypeDoc6_1Column" valueType="string" style="text-align:left;"
									onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>	</td>
					<td width="2%">	<input type="textbox" id="T1RXXXXG42S" value="" ROWNUM="1"
									size="2" position="47" addType="KodDocROVPD5_1Column" valueType="string" style="text-align:left;"
									onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>	</td>
					<td width="2%">	<input type="textbox" id="T1RXXXXG43S" value="" ROWNUM="1"
									size="2" position="47" addType="KodDocROVPD5_1Column" valueType="string" style="text-align:left;"
									onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td><input type="textbox" id="T1RXXXXG5S" value="" ROWNUM="1"
									size="23" position="48" addType="StrColumn" valueType="string" style="text-align:left;"
									onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T1RXXXXG6" value="" ROWNUM="1" canBeX="true"
									size="12" position="49" addType="IndTaxNumColumn" valueType="unsignedLong" style="text-align:right;"
									onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td><input type="textbox" id="T1RXXXXG7" value="" ROWNUM="1"
									 size="16" position="50" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									 onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T1RXXXXG8" value="" ROWNUM="1"
									 size="16" position="51" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									 onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T1RXXXXG9" value="" ROWNUM="1"
									 size="16" position="52" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									 onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T1RXXXXG10" value="" ROWNUM="1"
									 size="16" position="53" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									 onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T1RXXXXG11" value="" ROWNUM="1"
									 size="16" position="54" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									 onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T1RXXXXG12" value="" ROWNUM="1"
									 size="16" position="55" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									 onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T1RXXXXG13" value="" ROWNUM="1"
									 size="16" position="55" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									 onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
				</tr>
	   </xsl:when>
		<xsl:otherwise>
		   <xsl:for-each select = "$T1[generate-id(.)=generate-id(key('grT1', ./@ROWNUM))]">
		   	<xsl:sort select="./@ROWNUM" data-type="number" />
				<xsl:variable name="rownum" select="number(./@ROWNUM)"/>
				<xsl:variable name="row" select="key('grT1', $rownum)"/>

				<tr  align="center" id="StretchTable" rownum="{$rownum}">
					<td>
						<span id="spRownum">
							<input type="textbox" id="T1RXXXXG1" value="{$row[substring-after(name(),'XG')='1']}" ROWNUM="{$rownum}" size="6"
							position="10" addType="IntColumn" valueType="xs:integer" style="text-align:right;"
							onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();"
							onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
						</span>
					</td>
					<td>
						<input type="textbox" id="T1RXXXXG2D" value="{$row[substring-after(name(),'XG')='2D']}" ROWNUM="{$rownum}"
						size="10" position="45" addType="DateColumn" valueType="date" style="text-align:center;"
						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
					<td>
						<input type="textbox" id="T1RXXXXG3S" value="{$row[substring-after(name(),'XG')='3S']}" ROWNUM="{$rownum}"
 						size="10" position="46" addType="StrColumn" valueType="string" style="text-align:left;"
 						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
					<td>
						<input type="textbox" id="T1RXXXXG31" value="{$row[substring-after(name(),'XG')='31']}" ROWNUM="{$rownum}"
 						size="10" position="46" addType="I2inomColumn" valueType="int" style="text-align:center;"
 						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
					<td width="2%">
						<input type="textbox" id="T1RXXXXG41S" value="{$row[substring-after(name(),'XG')='41S']}" ROWNUM="{$rownum}"
						size="4" position="47" addType="DGKodTypeDoc6_1Column" valueType="string" style="text-align:left;"
						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
          <td width="2%">
						<input type="textbox" id="T1RXXXXG42S" value="{$row[substring-after(name(),'XG')='42S']}" ROWNUM="{$rownum}"
						size="2" position="47" addType="DGKodСausesOperation6Column" valueType="string" style="text-align:left;"
						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
         <td width="2%">
						<input type="textbox" id="T1RXXXXG43S" value="{$row[substring-after(name(),'XG')='43S']}" ROWNUM="{$rownum}"
						size="2" position="47" addType="DGKodRectification6Column" valueType="string" style="text-align:left;"
						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
					<td>
						<input type="textbox" id="T1RXXXXG5S" value="{$row[substring-after(name(),'XG')='5S']}" ROWNUM="{$rownum}"
						size="23" position="48" addType="StrColumn" valueType="string" style="text-align:left;"
						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
					<td>
						<input type="textbox" canBeX="true" id="T1RXXXXG6" value="{$row[substring-after(name(),'XG')='6']}" ROWNUM="{$rownum}"
						size="12" position="49" addType="IndTaxNumColumn" valueType="unsignedLong" style="text-align:right;"
						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
					<td>
						<input type="textbox" id="T1RXXXXG7" value="{$row[substring-after(name(),'XG')='7']}" ROWNUM="{$rownum}"
						 size="16" position="50" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						 onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
					<td>
						<input type="textbox" id="T1RXXXXG8" value="{$row[substring-after(name(),'XG')='8']}" ROWNUM="{$rownum}"
						size="16" position="51" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
					<td>
						<input type="textbox" id="T1RXXXXG9" value="{$row[substring-after(name(),'XG')='9']}" ROWNUM="{$rownum}"
						size="16" position="52" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
					<td>
						<input type="textbox" id="T1RXXXXG10" value="{$row[substring-after(name(),'XG')='10']}" ROWNUM="{$rownum}"
						size="16" position="53" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
					<td>
						<input type="textbox" id="T1RXXXXG11" value="{$row[substring-after(name(),'XG')='11']}" ROWNUM="{$rownum}"
						size="16" position="54" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
					<td>
						<input type="textbox" id="T1RXXXXG12" value="{$row[substring-after(name(),'XG')='12']}" ROWNUM="{$rownum}"
						 size="16" position="55" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						 onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
					 <td>
						<input type="textbox" id="T1RXXXXG13" value="{$row[substring-after(name(),'XG')='13']}" ROWNUM="{$rownum}"
						 size="16" position="55" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						 onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
					</td>
				</tr>

		   </xsl:for-each>
		</xsl:otherwise>
	</xsl:choose>
</tbody>
							<tr align="center" >
								<td align="left" colspan="9">Усього за звітний (податковий) період </td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R011G7']" /></xsl:attribute>
										<xsl:attribute name="id">R011G7</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">56</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R011G8']" /></xsl:attribute>
										<xsl:attribute name="id">R011G8</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">57</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R011G9']" /></xsl:attribute>
										<xsl:attribute name="id">R011G9</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">58</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R011G10']" /></xsl:attribute>
										<xsl:attribute name="id">R011G10</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">59</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R011G11']" /></xsl:attribute>
										<xsl:attribute name="id">R011G11</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">60</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R011G12']" /></xsl:attribute>
										<xsl:attribute name="id">R011G12</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">61</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R011G13']" /></xsl:attribute>
										<xsl:attribute name="id">R011G13</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">61</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
							</tr>
							<tr align="center" >
								<td  colspan="9">З них включено до уточнюючих розрахунків за звітний (податковий) період </td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R012G7']" /></xsl:attribute>
										<xsl:attribute name="id">R012G7</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">62</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R012G8']" /></xsl:attribute>
										<xsl:attribute name="id">R012G8</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">63</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R012G9']" /></xsl:attribute>
										<xsl:attribute name="id">R012G9</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">64</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R012G10']" /></xsl:attribute>
										<xsl:attribute name="id">R012G10</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">65</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R012G11']" /></xsl:attribute>
										<xsl:attribute name="id">R012G11</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">66</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R012G12']" /></xsl:attribute>
										<xsl:attribute name="id">R012G12</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">67</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R012G13']" /></xsl:attribute>
										<xsl:attribute name="id">R012G13</xsl:attribute>
										<xsl:attribute name="size">16</xsl:attribute>
										<xsl:attribute name="position">67</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
							</tr>
						</table>
<br />
<table width="100%">
							<tr>
								<td align="left"> <font color="green">
									<b>**4.вид документа </b>    <br />
<b>1-е поле: </b>вид документа згідно з такими позначеннями:        <br />
ПНП – податкова накладна, складена на паперових носіях;       <br />
ПНЕ – електронна податкова накладна.                          <br />
РКП – розрахунок коригування кількісних і вартісних показників до податкової накладної (додаток 2 до податкової накладної), складений на паперових носіях; <br />
РКЕ – електронний розрахунок коригування кількісних і вартісних показників до податкової накладної (додаток 2 до податкової накладної);   <br />
МДП – митна декларація, складена на паперових носіях;   <br />
МДЕ – електронна митна декларація;     <br />
БО – документ бухгалтерського обліку.</font >
								 </td>
							</tr>
							 <tr>
							 <td align="left"><font color="green">
									<b> тип причини для ПН та РК </b>
<b> 2-е поле: </b> тип причини у разі складання податкової накладної  (ПН або РК) за окремими операціями, визначеними у пункті 8 Порядку
заповнення податкової накладної (цифри від 01 до 15 з лідируючим нулем)</font >
								 </td>
							</tr>
							<tr>
							<td align="left"><font color="green">
									<b> включаються до уточнюючих розрахунків  </b>
<b>3-е поле: </b> літера У (у разі якщо дані документа включаються до уточнюючих розрахунків за звітний (податковий) період)
								</font >
</td>
							</tr>
						</table>
						<br />
 						<table width="100%">
							<tr>
								<td align="left">
									<p>
										<strong>Розділ II.  Отримані податкові накладні</strong>
									</p>
								</td>
							</tr>
						</table>
						<table width="120%" border="1" cellpadding="1" cellspacing="0" bordercolor="#000000">
							<tr>
								<td rowspan="4" align="center">
									№<br/>з/п<br />Початковий номер <br />
									<xsl:element name="input" >
										<xsl:attribute name="value" >
											<xsl:choose>
												<xsl:when test="count(//DECLARBODY/T2RXXXXG1)=0">
													<xsl:text>1</xsl:text>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="string(//DECLARBODY/T2RXXXXG1[@ROWNUM=1])"   />
												</xsl:otherwise>
											</xsl:choose>
										</xsl:attribute>
										<xsl:attribute name="id">PNUM</xsl:attribute>
										<xsl:attribute name="size">50</xsl:attribute>
										<xsl:attribute name="position">4</xsl:attribute>
										<xsl:attribute name="valueType">string</xsl:attribute>
										<xsl:attribute name="style">text-align:right; width:80%;</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>

								<td colspan="9" align="center">Податкова накладна, розрахунок коригування кількісних та вартісних показників до податкової накладної,
митна декларація, касовий чек, транспортний квиток, готельний рахунок, рахунок за послуги зв'язку, рахунок за послуги,
вартість яких визначається за показниками приладів обліку, заява та копії товарних чеків або інших розрахункових документів,
що засвідчують факт сплати податку у зв’язку з придбанням таких товарів/послуг, або копії первинних документів,
складених відповідно до Закону України "Про бухгалтерський облік та фінансову звітність в Україні",
що підтверджують факт отримання таких товарів/послуг, відповідно до пункту 201.10 статті 201 розділу V Податкового кодексу України тощо</td>
								<td rowspan="4" align="center">Загальна сума, включаючи податок на додану вартість </td>
								<td colspan="8" align="center">Придбання (виготовлення, будівництво, спорудження), ввезення на митну територію України товарів, придбанн
послуг, включаючи одержання послуг від нерезидента:</td>
							</tr>
							<tr>
								<td rowspan="3" align="center">дата отримання</td>
								<td rowspan="3" align="center">дата складання </td>
								<td rowspan="3" align="center">порядковий номер (реєстраційний номер - для митної декларації)</td>
								<td rowspan="3" align="center">Позначка "7", яка вказує що ПН (РК) складена на операції, які оподат-ковуються за ставкою 7 %</td>
								<td rowspan="3" colspan="3" align="center">вид документа<font color="green">***</font></td>
								<td colspan="2" align="center">постачальник </td>
								<td colspan="4" align="center">
									<span class="style4">з метою їх використання у межах господарської діяльності для здійснення операцій, які:</span>
								</td>
								<td colspan="2" align="center">
									<span class="style4"> які не призначаються для їх використання у господарській діяльності </span>
								</td>
								<td colspan="2" align="center">
									<span class="style4">для постачання послуг за межами митної території України або послуг, місце постачання яких визначається відповідно до
 пункту 186.3 статті 186 розділу V Кодексу за межами митної території України		</span>    	</td>
							</tr>
							<tr>
								<td rowspan="2" align="center">
									<span class="style4">найменування (П.І.Б. - для фізичної особи-підприємця)</span>
								</td>
								<td rowspan="2" align="center">
									<span class="style4">індивідуальний податковий  номер</span>
								</td>
								<td colspan="2" align="center">
									<span class="style4">підлягають оподаткуванню за основною ставкою,   ставкою 0 %	</span>
								</td>
								<td colspan="2" align="center">
									<span class="style4">звільнені від оподаткування, не є об'єктами оподаткування 			</span>
								</td>
								<td rowspan="2" align="center">
									<span class="style4">вартість без податку на додану вартість		</span>
								</td>
								<td rowspan="2" align="center">
									<span class="style4">сума податку на додану вартість			</span>
								</td>
								<td rowspan="2" align="center">
									<span class="style4">вартість без податку на додану вартість		</span>
								</td>
								<td rowspan="2" align="center">
									<span class="style4">сума податку на додану вартість	 </span>
								</td>
							</tr>
							<tr>
								<td align="center">
									<span class="style4"> вартість без податку на додану вартість		 </span>
								</td>
								<td align="center">
									<span class="style4">сума податку на додану вартість	 </span>
								</td>
								<td align="center">
									<span class="style4">вартість без податку на додану вартість		  </span>
								</td>
								<td align="center">
									<span class="style4">сума податку на додану вартість	 </span>
								</td>
							</tr>
						<tbody id="Process">
             	<tr>
								<td width="2%" align="center">1</td>
								<td width="3%" align="center">2</td>
								<td width="3%" align="center">3</td>
								<td width="3%" align="center" >4</td>
								<td width="3%" align="center" >4a</td>
								<td width="3%" colspan="3" align="center">5</td>
								<td width="17%" align="center">6</td>
								<td width="6%" align="center">7</td>
								<td width="7%" align="center">8</td>
								<td width="7%" align="center">9</td>
								<td width="7%" align="center">10</td>
								<td width="7%" align="center">11</td>
								<td width="7%" align="center">12</td>
								<td width="7%" align="center">13</td>
								<td width="7%" align="center">14</td>
								<td width="7%" align="center">15</td>
								<td width="7%" align="center">16</td>
							</tr>
						<!--begin Output Table T2-->

	<!--Output Table-->
    <xsl:choose>
		<xsl:when  test="count($T2)=0">
				<tr align="center" id="StretchTable" rownum="1">
					<td>
						<span id="spRownum">
							<input type="textbox" id="T2RXXXXG1" value="" ROWNUM="1" size="6"
							position="10" addType="IntColumn" valueType="xs:integer" style="text-align:right;"
							onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();"
							onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
						</span>
					</td>
					<td><input type="textbox" id="T2RXXXXG2D" value="" ROWNUM="1"
									  size="10" position="12" addType="DateColumn" valueType="date" style="text-align:center;"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>  </td>
					<td><input type="textbox" id="T2RXXXXG3D" value="" ROWNUM="1"
					 			   size="10" position="13" addType="DateColumn" valueType="date" style="text-align:center;"
					 			   onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> 	</td>
					<td> <input type="textbox" id="T2RXXXXG4S" value="" ROWNUM="1"
									  size="10" position="14" addType="StrColumn" valueType="string" style="text-align:left;"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>  </td>
					<td> <input type="textbox" id="T2RXXXXG41" value="" ROWNUM="1"
									  size="10" position="14" addType="I2inomColumn" valueType="int" style="text-align:center;"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>  </td>
					<td width="2%"><input type="textbox" id="T2RXXXXG51S" value="" ROWNUM="1"
									  size="4" position="15" addType="DGKodDocROVPD6_2Column" valueType="string" style="text-align:left;"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td width="2%">  	 <input type="textbox" id="T2RXXXXG52S" value="" ROWNUM="1"
									  size="4" position="15" addType="DGKodAssignment6Column" valueType="string" style="text-align:left;"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>  </td>
					<td width="2%">  	 <input type="textbox" id="T2RXXXXG53S" value="" ROWNUM="1"
									  size="4" position="15" addType="DGKodRectification6Column" valueType="string" style="text-align:left;"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td><input type="textbox" id="T2RXXXXG6S" value="" ROWNUM="1"
									  size="16" position="16" addType="StrColumn" valueType="string" style="text-align:left;"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td><input type="textbox" id="T2RXXXXG7" value="" ROWNUM="1" canBeX="true"
									  size="12" position="17" addType="IndTaxNumColumn" valueType="unsignedLong" style="text-align:right;"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>  </td>
					<td><input type="textbox" id="T2RXXXXG8" value="" ROWNUM="1"
									  size="11" position="18" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td><input type="textbox" id="T2RXXXXG9" value="" ROWNUM="1"
 								     size="11" position="19" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
 								     onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T2RXXXXG10" value="" ROWNUM="1"
									 size="11" position="20" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									 onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T2RXXXXG11" value="" ROWNUM="1"
									  size="11" position="21" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T2RXXXXG12" value="" ROWNUM="1"
									  size="11" position="22" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T2RXXXXG13" value="" ROWNUM="1"
									  size="11" position="23" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T2RXXXXG14" value="" ROWNUM="1"
									  size="11" position="24" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T2RXXXXG15" value="" ROWNUM="1"
									  size="11" position="25" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
					<td><input type="textbox" id="T2RXXXXG16" value="" ROWNUM="1"
									  size="11" position="26" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
									  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/></td>
				</tr>
	   </xsl:when>
		<xsl:otherwise>
		   <xsl:for-each select = "$T2[generate-id(.)=generate-id(key('grT2', ./@ROWNUM))]">
		   	<xsl:sort select="./@ROWNUM" data-type="number" />
				<xsl:variable name="rownum" select="number(./@ROWNUM)"/>
				<xsl:variable name="row" select="key('grT2', $rownum)"/>

				<tr  align="center" id="StretchTable" rownum="{$rownum}">
					<td>
						<span id="spRownum">
							<input type="textbox" id="T2RXXXXG1" value="{$row[substring-after(name(),'XG')='1']}" ROWNUM="{$rownum}" size="6"
							position="10" addType="IntColumn" valueType="xs:integer" style="text-align:right;"
							onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();"
							onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>
						</span>
					</td>
					<td>
						<input type="textbox" id="T2RXXXXG2D" value="{$row[substring-after(name(),'XG')='2D']}" ROWNUM="{$rownum}"
  						size="10" position="12" addType="DateColumn" valueType="date" style="text-align:center;"
  						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td>
						<input type="textbox" id="T2RXXXXG3D" value="{$row[substring-after(name(),'XG')='3D']}" ROWNUM="{$rownum}"
						size="10" position="13" addType="DateColumn" valueType="date" style="text-align:center;"
						onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td>
						<input type="textbox" id="T2RXXXXG4S" value="{$row[substring-after(name(),'XG')='4S']}" ROWNUM="{$rownum}"
						  size="10" position="14" addType="StrColumn" valueType="string" style="text-align:left;"
						  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>   </td>
					<td>
						<input type="textbox" id="T2RXXXXG41" value="{$row[substring-after(name(),'XG')='41']}" ROWNUM="{$rownum}"
						  size="10" position="14" addType="I2inomColumn" valueType="int" style="text-align:center;"
						  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td width="2%">
						<input type="textbox" id="T2RXXXXG51S" value="{$row[substring-after(name(),'XG')='51S']}" ROWNUM="{$rownum}"
						  size="4" position="15" addType="DGKodDocROVPD6_2Column" valueType="string" style="text-align:left;"
						  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td width="2%">
						<input type="textbox" id="T2RXXXXG52S" value="{$row[substring-after(name(),'XG')='52S']}" ROWNUM="{$rownum}"
						  size="4" position="15" addType="DGKodAssignment6Column" valueType="string" style="text-align:left;"
						  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td width="2%">
						<input type="textbox" id="T2RXXXXG53S" value="{$row[substring-after(name(),'XG')='53S']}" ROWNUM="{$rownum}"
						  size="4" position="15" addType="DGKodRectification6Column" valueType="string" style="text-align:left;"
						  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>	</td>
					<td>
						<input type="textbox" id="T2RXXXXG6S" value="{$row[substring-after(name(),'XG')='6S']}" ROWNUM="{$rownum}"
								  size="16" position="16" addType="StrColumn" valueType="string" style="text-align:left;"
								  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>	</td>
					<td>
						<input type="textbox" canBeX="true" id="T2RXXXXG7" value="{$row[substring-after(name(),'XG')='7']}" ROWNUM="{$rownum}"
						  size="12" position="17" addType="IndTaxNumColumn" valueType="unsignedLong" style="text-align:right;"
						  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td>
						<input type="textbox" id="T2RXXXXG8" value="{$row[substring-after(name(),'XG')='8']}" ROWNUM="{$rownum}"
						  size="11" position="18" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td>
						<input type="textbox" id="T2RXXXXG9" value="{$row[substring-after(name(),'XG')='9']}" ROWNUM="{$rownum}"
						  size="11" position="19" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td>
						<input type="textbox" id="T2RXXXXG10" value="{$row[substring-after(name(),'XG')='10']}" ROWNUM="{$rownum}"
						  size="11" position="20" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td>
						<input type="textbox" id="T2RXXXXG11" value="{$row[substring-after(name(),'XG')='11']}" ROWNUM="{$rownum}"
						  size="11" position="21" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td>
						<input type="textbox" id="T2RXXXXG12" value="{$row[substring-after(name(),'XG')='12']}" ROWNUM="{$rownum}"
						  size="11" position="22" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td>
						<input type="textbox" id="T2RXXXXG13" value="{$row[substring-after(name(),'XG')='13']}" ROWNUM="{$rownum}"
						  size="11" position="23" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>  </td>
					<td>
						<input type="textbox" id="T2RXXXXG14" value="{$row[substring-after(name(),'XG')='14']}" ROWNUM="{$rownum}"
  					  size="11" position="24" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
  					  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/>  </td>
					<td>
						<input type="textbox" id="T2RXXXXG15" value="{$row[substring-after(name(),'XG')='15']}" ROWNUM="{$rownum}"
						  size="11" position="25" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
						  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
					<td>
						<input type="textbox" id="T2RXXXXG16" value="{$row[substring-after(name(),'XG')='16']}" ROWNUM="{$rownum}"
							  size="11" position="26" addType="Decimal2Column" valueType="decimal" style="text-align:right;" precision="2"
							  onblur="inputOnBlur();" onclick="inputOnClick();" ondblclick="inputOnDblClick();" onkeydown="inputOnKeyDown();" onchange="inputOnChange();"/> </td>
				</tr>

		   </xsl:for-each>
		</xsl:otherwise>
	</xsl:choose>
</tbody>
							<tr>
								<td colspan="10">Усього за звітний період</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R021G8']" /></xsl:attribute>
										<xsl:attribute name="id">R021G8</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">27</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R021G9']" /></xsl:attribute>
										<xsl:attribute name="id">R021G9</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">28</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R021G10']" /></xsl:attribute>
										<xsl:attribute name="id">R021G10</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">29</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R021G11']" /></xsl:attribute>
										<xsl:attribute name="id">R021G11</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">30</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R021G12']" /></xsl:attribute>
										<xsl:attribute name="id">R021G12</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">31</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R021G13']" /></xsl:attribute>
										<xsl:attribute name="id">R021G13</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">32</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R021G14']" /></xsl:attribute>
										<xsl:attribute name="id">R021G14</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">33</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R021G15']" /></xsl:attribute>
										<xsl:attribute name="id">R021G15</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">34</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R021G16']" /></xsl:attribute>
										<xsl:attribute name="id">R021G16</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">35</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
							</tr>
							<tr>
								<td colspan="10">З них включено до уточнюючих розрахунків за звітний період</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R022G8']" /></xsl:attribute>
										<xsl:attribute name="id">R022G8</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">36</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R022G9']" /></xsl:attribute>
										<xsl:attribute name="id">R022G9</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">37</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R022G10']" /></xsl:attribute>
										<xsl:attribute name="id">R022G10</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">38</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R022G11']" /></xsl:attribute>
										<xsl:attribute name="id">R022G11</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">39</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R022G12']" /></xsl:attribute>
										<xsl:attribute name="id">R022G12</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">40</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R022G13']" /></xsl:attribute>
										<xsl:attribute name="id">R022G13</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">41</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R022G14']" /></xsl:attribute>
										<xsl:attribute name="id">R022G14</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">42</xsl:attribute>
  									    <xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R022G15']" /></xsl:attribute>
										<xsl:attribute name="id">R022G15</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">43</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
								<td>
									<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='R022G16']" /></xsl:attribute>
										<xsl:attribute name="id">R022G16</xsl:attribute>
										<xsl:attribute name="size">11</xsl:attribute>
										<xsl:attribute name="position">44</xsl:attribute>
										<xsl:attribute name="addType">DGdecimal2</xsl:attribute>
										<xsl:attribute name="valueType">decimal</xsl:attribute>
										<xsl:attribute name="style">text-align:right;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
							</tr>
						</table>
		 <br />
<table width="100%">
							<tr>
								<td align="left">  <font color="green">									<b>***5. вид документа </b>    <br />
<b>1-е поле:</b> вид документа згідно з такими позначеннями:
ПНП – податкова накладна, складена на паперових носіях;      <br />
ПНЕ  – електронна податкова накладна;        <br />
РКП – розрахунок коригування кількісних і вартісних показників до податкової накладної (додаток 2 до податкової накладної), складений на паперових носіях;  <br />
РКЕ – електронний розрахунок коригування кількісних і вартісних показників до податкової накладної (додаток 2 до податкової накладної); <br />
МДП – митна декларація, складена на паперових носіях;   <br />
МДЕ – електронна митна декларація; <br />
ЧК – касовий чек.   <br />
ТК – транспортний квиток;  <br />
ГР – готельний рахунок;  <br />
ПЗ – рахунок за послуги зв’язку; <br />
ПО – послуги, вартість яких визначається за показниками приладів обліку;   <br />
ЗП – заява платника та копії товарних чеків або інших розрахункових документів, що засвідчують факт сплати податку у зв’язку з придбанням таких товарів/послуг,
або копії первинних документів, складених відповідно до Закону України „Про бухгалтерський облік та фінансову звітність в Україні”,
 що підтверджують факт отримання таких товарів/послуг відповідно до            пункту 201.10 статті 201 розділу V Кодексу; <br />
НП – документ, що засвідчує придбання товарів/послуг на митній території України в осіб, які не зареєстровані як платники податку на додану вартість;   <br />
БО – документ бухгалтерського обліку, в тому числі бухгалтерська довідка.   <br />
Види бухгалтерских довідок: БОПНП, БОПНЕ, БОРКП, БОРКЕ, БОМДП, БОМДЕ, БОЧК, БОТК, БОГР, БОПЗ, БОПО.    			 </font>
я				 </td>
							</tr>
							 <tr>
							 <td align="left"><font color="green">
	 	<b>2-е поле: </b> літера Р (у разі якщо платником проводиться розподіл сум податкового кредиту відповідно до пункту 199.1 статті 199 розділу V Кодексу)	</font> </td>
							</tr>
							<tr>
							<td align="left"><font color="green">
									<b>3-е поле:  </b>  літера У (у разі якщо дані документа включаються до уточнюючих розрахунків за звітний (податковий) період)	</font></td>
							</tr>
						</table>
						<br />
	<br />
				<table width="60%" >
						<tr>
								<td width="40%" >Подано електронну копію реєстру до контролюючого органу.</td>
								<td width="30%" align="right">Дата подання копії реєстру<font color="red"> * </font ></td>

                <td  align="left" width="20%">
									<xsl:element name="input" >
										<xsl:attribute name="value" ><xsl:value-of select="//DECLARBODY/*[name()='HFILL']"  /></xsl:attribute>
										<xsl:attribute name="id">HFILL</xsl:attribute>
										<xsl:attribute name="size">50</xsl:attribute>
										<xsl:attribute name="position">4</xsl:attribute>
										<xsl:attribute name="addType">DGDate</xsl:attribute>
										<xsl:attribute name="valueType">date</xsl:attribute>
										<xsl:attribute name="style">text-align:left;</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
								</td>
							</tr>
						 		</table>

<br />
	<TABLE width="100%" cellspacing="0" border="0">
 <TR>
    <TD width="480"><B>Керівник</B><font color="red"> * </font ></TD>
		<TD width="10" ><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
		<TD width="200" class="td_unln"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
		<TD width="10" ><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
		<TD width="600" align="center" class="td_unln">
                    <xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='HBOS']" /></xsl:attribute>
										<xsl:attribute name="id">HBOS</xsl:attribute>
										<xsl:attribute name="size">100</xsl:attribute>
										<xsl:attribute name="position">41</xsl:attribute>
										<xsl:attribute name="addType">DGHBOS</xsl:attribute>
										<xsl:attribute name="valueType">string</xsl:attribute>
										<xsl:attribute name="style">text-align:right; width=100%;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element><br />
</TD>
		<TD rowspan="8" align="center"><H2>М.П.</H2></TD>
	</TR>
	 <TR>
    <TD width="480">
										<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='HKBOS']" /></xsl:attribute>
										<xsl:attribute name="id">HKBOS</xsl:attribute>
										<xsl:attribute name="size">100</xsl:attribute>
										<xsl:attribute name="position">41</xsl:attribute>
										<xsl:attribute name="addType">DGHKBOS</xsl:attribute>
										<xsl:attribute name="valueType">string</xsl:attribute>
										<xsl:attribute name="style">text-align:right; width=100%;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
     </TD>
		<TD width="10" align="center"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
		<TD width="200"  align="center">(підпис)</TD>
		<TD width="10" ><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
		<TD width="600" align="center" >(ініціали та прізвище)  </TD>
			</TR>
		<TR><TD>(Реєстраційний номер облікової картки платника податків)*</TD></TR>

	<TR>
    <TD width="480"><B>Головний бухгалтер</B></TD>
		<TD width="10" ><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
		<TD width="200" class="td_unln"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
		<TD width="10" ><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
		<TD width="600" align="center" class="td_unln">
                    <xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='HBUH']" /></xsl:attribute>
										<xsl:attribute name="id">HBUH</xsl:attribute>
										<xsl:attribute name="size">100</xsl:attribute>
										<xsl:attribute name="position">41</xsl:attribute>
										<xsl:attribute name="addType">DGHBUH</xsl:attribute>
										<xsl:attribute name="valueType">string</xsl:attribute>
										<xsl:attribute name="style">text-align:right; width=100%;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element><br />
</TD>
			</TR>
 <TR>
    <TD width="480">
										<xsl:element name="input">
										<xsl:attribute name="value"><xsl:value-of select="//DECLARBODY/*[name()='HKBUH']" /></xsl:attribute>
										<xsl:attribute name="id">HKBUH</xsl:attribute>
										<xsl:attribute name="size">100</xsl:attribute>
										<xsl:attribute name="position">41</xsl:attribute>
										<xsl:attribute name="addType">DGHKBUH</xsl:attribute>
										<xsl:attribute name="valueType">string</xsl:attribute>
										<xsl:attribute name="style">text-align:right; width=100%;</xsl:attribute>
										<xsl:attribute name="precision">2</xsl:attribute>
										<xsl:attribute name="onclick">inputOnClick();</xsl:attribute>
										<xsl:attribute name="ondblclick">inputOnDblClick();</xsl:attribute>
										<xsl:attribute name="onblur">inputOnBlur();</xsl:attribute>
										<xsl:attribute name="onchange">inputOnChange();</xsl:attribute>
										<xsl:attribute name="onkeydown">inputOnKeyDown();</xsl:attribute>
									</xsl:element>
     </TD>
		<TD width="10" align="center"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
		<TD width="200"  align="center">(підпис)</TD>
		<TD width="10" ><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
		<TD width="600" align="center" >(ініціали та прізвище)  </TD>
			</TR>
		<TR><TD>(Реєстраційний номер облікової картки платника податків)*</TD></TR>


  <TR>
    <TD width="480"><B>Платник ПДВ (для фізичної особи - підприємця)</B></TD>
		<TD width="10" ><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
		<TD width="200" class="td_unln"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
		<TD width="10" ><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
		<TD width="600" align="center" class="td_unln"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>                   </TD>
					</TR>

  <TR>
    <TD width="480" align="center" colspan="2"><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text>           </TD>
		<TD align="center"><FONT size="-1">(підпис)</FONT></TD>
		<TD width="10" ><xsl:text disable-output-escaping="yes">&amp;nbsp;</xsl:text></TD>
    <TD align="center"><font size="-1">(ініціали та прізвище) </font></TD>

	</TR>      </TABLE>
	 <table width="100%" >
						<tr>
								<td  >*Для фізичних осіб, які через свої релігійні переконання відмовляються від прийняття реєстраційного номера облікової картки платника
податків та офіційно повідомили про це відповідний орган державної податкової служби і мають відмітку у паспорті, заначаються серія та номер паспорта </td>
               							</tr>
						 		</table>



					</body>
				</html>
			</xsl:template>
		</xsl:stylesheet>



