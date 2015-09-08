<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding =" UTF-8" method =" xml" indent =" yes "/>

	<xsl:template match="/"> 
	   <xsl:element name="HTML">
			   <xsl:element name="HEAD" >
				   <xsl:element name="TITLE">Datos de DNI </xsl:element></xsl:element>
				   
				   <xsl:element name="link"> 
					   <xsl:attribute name="rel">stylesheet</xsl:attribute>
					   <xsl:attribute name="type">text/css</xsl:attribute>
					   <xsl:attribute name="href">estiloDni.css</xsl:attribute>
					</xsl:element>
			    </xsl:element>
			   <xsl:element name="BODY">
					<xsl:attribute name="class">tbody</xsl:attribute>		   
				   <xsl:for-each select="listaDNI/dni">
				  
					   <!-- CARA 1-->
					   <xsl:element name="DIV">
								<xsl:attribute name="class">delante</xsl:attribute>
									<!-- Numero de dni-->
										 <xsl:element name="DIV">
												 <xsl:attribute name="class">numdni</xsl:attribute>
												 <xsl:text> Numero DNI </xsl:text> 
												 <xsl:value-of select='./numDni' />
										 </xsl:element>
											
											
									<!-- Primer apellido-->
									 <xsl:element name="DIV">
												 <xsl:attribute name="class">priape</xsl:attribute>
											<xsl:text> Primer Apellido </xsl:text> 
											<xsl:value-of select='./primerAp' />
									  </xsl:element>
									<!-- Segundo apellido-->
									<xsl:element name="DIV">
												 <xsl:attribute name="class">priape</xsl:attribute>
											<xsl:text> Segundo Apellido </xsl:text> 
											<xsl:value-of select='./segundoAp' />
									</xsl:element>
									<!-- Nombre -->
									<xsl:element name="DIV">
												 <xsl:attribute name="class">segape</xsl:attribute>
											<xsl:text> Nombre </xsl:text> 
											<xsl:value-of select='./nombres' />
									</xsl:element>
									<!-- Sexo -->
									<xsl:element name="DIV">
												 <xsl:attribute name="class">Sex</xsl:attribute>
											<xsl:text> Sexo </xsl:text> 
											<xsl:value-of select='./sexo' />
									</xsl:element>
									<!-- Nacionalidad-->	
									<xsl:element name="DIV">
												 <xsl:attribute name="class">nac</xsl:attribute>
											<xsl:text> Nacionalidad </xsl:text> 
											<xsl:value-of select='./nacionalidad/@nald' />
									</xsl:element>
									<!-- Fecha de Nacimiento-->
									<xsl:element name="DIV">
												 <xsl:attribute name="class">fech</xsl:attribute>
											<xsl:text> Fecha de Nacimiento </xsl:text> 
											<xsl:value-of select='./fecha/@dia' />
											<xsl:value-of select='./fecha/@mes' />
											<xsl:value-of select='./fecha/@year' />
									</xsl:element>									
									<!-- IDESP-->
									<xsl:element name="DIV">
												 <xsl:attribute name="class">idesp</xsl:attribute>
											<xsl:text> IDESP </xsl:text> 
											<xsl:value-of select='./idesp' />	
									</xsl:element>						
									<!-- Fecha de Nacimiento-->
									<xsl:element name="DIV">
												 <xsl:attribute name="class">val</xsl:attribute>
											<xsl:text> Fecha de Validez </xsl:text> 
											<xsl:value-of select='./valido/@dia' />
											<xsl:value-of select='./valido/@mes' />
											<xsl:value-of select='./valido/@year' />
									</xsl:element>
							</xsl:element> <!-- cierre div-->
																						
																						
																							
							<!-- CARA 2-->
							<xsl:element name="DIV">
								<xsl:attribute name="class">detras</xsl:attribute>
								<xsl:element name="TABLE" >
																									
									<!-- Lugar de Nacimiento-->
									<xsl:element name="tr">
										<xsl:element name="th"> 
											<xsl:text> Lugar de Nacimiento </xsl:text> 
										</xsl:element>
										<xsl:element name="th"> 
											<xsl:value-of select='./lugarNac' />
										</xsl:element>
									</xsl:element>
																										
									<!-- Provincia-->
									<xsl:element name="tr">
										<xsl:element name="th"> 
											<xsl:text> Provincia </xsl:text> 
										</xsl:element>
										<xsl:element name="th"> 
											<xsl:value-of select='./prov' />
										</xsl:element>
									</xsl:element>
																									
									<!-- Pais-->
									<xsl:element name="tr">
										<xsl:element name="th"> 
											<xsl:text> Pais </xsl:text> 
										</xsl:element>
										<xsl:element name="th"> 
											<xsl:value-of select='./pais' />
										</xsl:element>
									</xsl:element>

																									
									<!-- Padre -->
									<xsl:element name="tr">
										<xsl:element name="th"> 
											<xsl:text> Nombre del Padre </xsl:text> 
										</xsl:element>
										<xsl:element name="th"> 
											<xsl:value-of select='./padre' />
										</xsl:element>
									</xsl:element>
									
									<!-- Madre -->
									<xsl:element name="tr">
										<xsl:element name="th"> 
											<xsl:text> Nombre de la madre </xsl:text> 
										</xsl:element>
										<xsl:element name="th"> 
											<xsl:value-of select='./madre' />
										</xsl:element>
									</xsl:element>													
																									
									<!-- Direccion -->
	
									<xsl:element name="tr">
										<xsl:element name="th"> 
											<xsl:text> Direccion </xsl:text> 
										</xsl:element>
										<xsl:element name="th"> 
											<xsl:value-of select='./dir' />
										</xsl:element>
									</xsl:element>
																	
									<!-- Lugar de domicilio -->
									<xsl:element name="tr">
										<xsl:element name="th"> 
											<xsl:text> Lugar </xsl:text> 
										</xsl:element>
										<xsl:element name="th"> 
											<xsl:value-of select='./lugar' />
										</xsl:element>
									</xsl:element>
																									
									<!-- Equipo -->
									<xsl:element name="tr">
											<xsl:element name="th"> 
												<xsl:text> Equipo </xsl:text> 
											</xsl:element>
											<xsl:element name="th"> 
											<xsl:value-of select='./equipo' />
										</xsl:element>
									</xsl:element>
																									 
									</xsl:element>  <!-- cierre de table-->
										 
									</xsl:element>  <!-- cierrre el div-->

						</xsl:for-each>
			   </xsl:element>			   
	   
	</xsl:template>
	
	<xsl:template match="fecha[@dia][@mes][@year]">
		<xsl:value-of select="concat(@dia,@mes,@year)" />
	</xsl:template>
</xsl:stylesheet>
