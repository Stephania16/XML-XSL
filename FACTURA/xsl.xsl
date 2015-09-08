<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output encoding="ISO-8859-1" method="xml" indent="yes" doctype-system="C:\Dropbox\IW\fact_trans\factura.dtd"/>
	<xsl:template match="/">
			<!--Nos posicionamos en el nodo padre y creamos su etiqueta-->
			<xsl:element name="listaFacturas">
				<!-- por cada factura de entrada voy a generar una de salida-->
						<xsl:apply-templates />		
			</xsl:element>
	</xsl:template>
	
	<xsl:template match="/factura_lista/factura">
		<xsl:element name="factura">
			<xsl:attribute name="num_factura">
				<xsl:text>f</xsl:text><xsl:value-of select="./destinatario/numero" />
			</xsl:attribute>
			
		<xsl:element name="datos_empresa">
			<xsl:element name="nombre">
				<xsl:value-of select="./remitente/nombre" />
			</xsl:element>
			<xsl:element name="dir">
				<xsl:element name="tipo">
					<xsl:value-of select="./remitente/calle" />
				</xsl:element>
				<xsl:element name="dom">
					<xsl:value-of select="./remitente/calle" />
				 </xsl:element>
				 <xsl:element name="numero">
					<xsl:value-of select="./remitente/numero" />
				</xsl:element>
			</xsl:element>
			<xsl:element name="poblacion">
				<xsl:attribute name="cod_postal"><xsl:value-of select="./remitente/cod_post" /></xsl:attribute>
				<xsl:value-of select="./remitente/pob" />
			</xsl:element>
			<xsl:element name="provincia">
				<xsl:value-of select="./remitente/prov" />
			</xsl:element>
			<xsl:element name="pais">
				<xsl:value-of select="./remitente/pais" />
			</xsl:element>
			<xsl:element name="cif">
				<xsl:value-of select="./remitente/id" />
			</xsl:element>
		</xsl:element>
		
		<xsl:element name="datos_cliente">
			<xsl:attribute name="num_cli">
					<xsl:text>c</xsl:text> <xsl:value-of select="./datos_consulta/num_cliente" />
				</xsl:attribute>
			<xsl:element name="nombre">
				<xsl:value-of select="./destinatario/nombre" />
			</xsl:element>
			<xsl:element name="dir_env">
				<xsl:element name="tipo">
					<xsl:value-of select="./destinatario/calle" />
				</xsl:element>
				<xsl:element name="dom">
					<xsl:value-of select="./destinatario/calle" />
				 </xsl:element>
				 <xsl:element name="numero">
					<xsl:value-of select="./destinatario/numero" />
				</xsl:element>
			</xsl:element>
			<xsl:element name="poblacion">
				<xsl:attribute name="cod_postal"><xsl:value-of select="./destinatario/cod_post" /></xsl:attribute>
				<xsl:value-of select="./destinatario/pob" />
			</xsl:element>
			<xsl:element name="provincia">
				<xsl:value-of select="./destinatario/prov" />
			</xsl:element>
			<xsl:element name="pais">
				<xsl:value-of select="./destinatario/pais" />
			</xsl:element>
		</xsl:element>
		
		<xsl:element name="datos_factura">
			<xsl:attribute name="num_ped">
				<xsl:text>p</xsl:text><xsl:value-of select="./datos_consulta/num_pedido" />
			</xsl:attribute>
			<xsl:attribute name="forma_pago">
				<xsl:text>tarjeta</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="iva">
				<xsl:text>iva16</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="moneda">
				<xsl:text>Euro</xsl:text>
			</xsl:attribute>
			
			<xsl:element name="fecha">
				<xsl:attribute name="dia">
					<xsl:value-of select="./fecha_pedido/dia" />
				</xsl:attribute>
				<xsl:attribute name="mes">
					<xsl:value-of select="./fecha_pedido/mes" />
				</xsl:attribute>
				<xsl:attribute name="year">
					<xsl:value-of select="./fecha_pedido/anio" />
				</xsl:attribute>
			</xsl:element>
			<xsl:comment>Interlocutor: Hanz Gruber</xsl:comment>
			<xsl:element name="linea">
				<xsl:element name="ref">
					<xsl:value-of select="./articulo/id_articulo" />
				</xsl:element>
				<xsl:element name="desc">
					<xsl:value-of select="./articulo/descripcion_art" />
				</xsl:element>
				<xsl:element name="cant">
					<xsl:value-of select="./articulo/cantidad_art" />
				</xsl:element>
				<xsl:element name="precio">
					<xsl:value-of select="./articulo/precio_art" />
				</xsl:element>
				<xsl:element name="importe">
					<xsl:value-of select="./interlocutor/tel_interloc" />
				</xsl:element>
			</xsl:element>
				<xsl:element name="iva">
					<xsl:value-of select="./iva" />
				</xsl:element>
				<xsl:element name="total">
					<xsl:value-of select="./total" />
				</xsl:element>
	
		</xsl:element>
		
		</xsl:element>
	</xsl:template>

	
</xsl:stylesheet>


