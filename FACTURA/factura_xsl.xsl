<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
<xsl:output encoding="ISO-8859-1" method="xml" indent="yes" doctype-system="C:\Users\Planet Media\Desktop\fact_trans\factura.dtd"/>
	<xsl:template match="/">
			<!--Nos posicionamos en el nodo padre y creamos su etiqueta-->
			<xsl:element name="listaFacturas">
				<!-- por cada factura de entrada voy a generar una de salida-->
						<xsl:apply-templates />		
			</xsl:element>
	</xsl:template>
	
	<xsl:template match="/factura_lista/factura">
		<!-- Creamos el nodo fatura de nuestra factura-->
		<xsl:element name="factura">
			<xsl:attribute name="num_factura">
				<xsl:text>f</xsl:text><xsl:value-of select="./destinatario/numero" />
			</xsl:attribute>
		<!-- creamos el nodo datos empresa-->	
		<xsl:element name="datos_empresa">
				<!--nodo nombre-->
				<xsl:call-template name="getNombre">
					<xsl:with-param name="internalName" select="./remitente/nombre"/>
				</xsl:call-template>
			<!-- nodo dir que tiene varios subtipos-->
			<xsl:element name="dir">
					<!--subtipo de dir->tipo-->
					<xsl:call-template name="getTipoDir">
						<xsl:with-param name="internalName" select="./remitente/calle"/>
					</xsl:call-template>
					<!--subtipo de dir->dom-->
					<xsl:call-template name="getDom">
						<xsl:with-param name="internalName" select="./remitente/calle"/>
					</xsl:call-template>
					<!--subtipo de dir->numero-->
					 <xsl:call-template name="getNum">
						<xsl:with-param name="internalName" select="./remitente/numero"/>
					</xsl:call-template>
			</xsl:element>
			<!--Creamos el subnodo datos empresa->población-->
			<xsl:call-template name="getPob">
						<xsl:with-param name="internalName" select="./remitente"/>
			</xsl:call-template>
			<!--Creamos el subnodo datos empresa->provincia-->
			<xsl:call-template name="getProv">
						<xsl:with-param name="internalName" select="./remitente/prov"/>
			</xsl:call-template>
			<!--Creamos el subnodo datos empresa->pais-->
			<xsl:call-template name="getPais">
						<xsl:with-param name="internalName" select="./remitente/pais"/>
			</xsl:call-template>
			<!--Creamos el subnodo datos empresa->cif-->
			<xsl:call-template name="getCif">
						<xsl:with-param name="internalName" select="./remitente/id"/>
			</xsl:call-template>
		</xsl:element>
		<!-- Creamos el nodo DATOS_CLIENTE de nuestra factura-->
		<xsl:element name="datos_cliente">
			<!--Creamos el subnodo datoscliente->num_cli-->
			<xsl:call-template name="getNumCli">
						<xsl:with-param name="internalName" select="./datos_consulta/num_cliente"/>
			</xsl:call-template>
			<xsl:call-template name="getMultiplesValuesDatosCli">
						<xsl:with-param name="internalName" select="./destinatario"/>
			</xsl:call-template>
		</xsl:element>
		<!-- Creamos el nodo DATOS_FACTURA de nuestra factura-->
		<xsl:element name="datos_factura">
			<xsl:call-template name="getMultiplesValuesDatosFactura">
						<xsl:with-param name="datosConsulta" select="./datos_consulta"/>
						<xsl:with-param name="fechaPedido" select="./fecha_pedido"/>
			</xsl:call-template>
			
		<!-- Creamos el nodo LINEA de nuestra factura-->
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
	<!--TEMPLATES CON NOMBRE Y PASO DE PARAMETROS-->
	<!--LOS NOMBRE DE LOS TEMPLATES DESCRIBEN POR SI MISMO LA FUNCIONALIDAD-->
    <xsl:template name="getNombre">
			<xsl:param name="internalName"/>
			<xsl:element name="nombre">
				<xsl:value-of select="$internalName" />
			</xsl:element>
    </xsl:template>
	 <xsl:template name="getTipoDir">
			<xsl:param name="internalName"/>
			<xsl:element name="tipo">
				<xsl:value-of select="$internalName" />
			</xsl:element>
    </xsl:template>
    <xsl:template name="getDom">
			<xsl:param name="internalName"/>
			<xsl:element name="dom">
				<xsl:value-of select="$internalName" />
			</xsl:element>
    </xsl:template>
    <xsl:template name="getNum">
			<xsl:param name="internalName"/>
			 <xsl:element name="numero">
				<xsl:value-of select="$internalName" />
			</xsl:element>
    </xsl:template>
    <xsl:template name="getPob">
			<xsl:param name="internalName"/>
			 <xsl:element name="poblacion">
				<xsl:attribute name="cod_postal"><xsl:value-of select="$internalName/cod_post" /></xsl:attribute>
				<xsl:value-of select="$internalName/pob" />
			</xsl:element>
    </xsl:template>
    <xsl:template name="getProv">
			<xsl:param name="internalName"/>
			 <xsl:element name="provincia">
				<xsl:value-of select="$internalName" />
			</xsl:element>
    </xsl:template>
     <xsl:template name="getPais">
			<xsl:param name="internalName"/>
			 <xsl:element name="pais">
				<xsl:value-of select="$internalName" />
			</xsl:element>
    </xsl:template>
    <xsl:template name="getCif">
			<xsl:param name="internalName"/>
			 <xsl:element name="cif">
				<xsl:value-of select="$internalName" />
			</xsl:element>
    </xsl:template>
    
    <xsl:template name="getNumCli">
			<xsl:param name="internalName"/>
			 <xsl:attribute name="num_cli">
					<xsl:text>c</xsl:text> <xsl:value-of select="$internalName" />
			</xsl:attribute>
    </xsl:template>
    
    <xsl:template name="getMultiplesValuesDatosCli">
			<xsl:param name="internalName"/>
			<xsl:element name="nombre">
				<xsl:value-of select="$internalName/nombre" />
			</xsl:element>
			<xsl:element name="dir_env">
				<xsl:element name="tipo">
					<xsl:value-of select="$internalName/calle" />
				</xsl:element>
				<xsl:element name="dom">
					<xsl:value-of select="$internalName/calle" />
				 </xsl:element>
				 <xsl:element name="numero">
					<xsl:value-of select="$internalName/numero" />
				</xsl:element>
			</xsl:element>
			<xsl:element name="poblacion">
				<xsl:attribute name="cod_postal"><xsl:value-of select="$internalName/cod_post" /></xsl:attribute>
				<xsl:value-of select="$internalName/pob" />
			</xsl:element>
			<xsl:element name="provincia">
				<xsl:value-of select="$internalName/prov" />
			</xsl:element>
			<xsl:element name="pais">
				<xsl:value-of select="$internalName/pais" />
			</xsl:element>
    </xsl:template>
    <xsl:template name="getMultiplesValuesDatosFactura">
			<xsl:param name="datosConsulta"/>
			<xsl:param name="fechaPedido"/>
			  <xsl:attribute name="num_ped">
				<xsl:text>p</xsl:text><xsl:value-of select="$datosConsulta/num_pedido" />
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
					<xsl:value-of select="$fechaPedido/dia" />
				</xsl:attribute>
				<xsl:attribute name="mes">
					<xsl:value-of select="$fechaPedido/mes" />
				</xsl:attribute>
				<xsl:attribute name="year">
					<xsl:value-of select="$fechaPedido/anio" />
				</xsl:attribute>
			</xsl:element>
			<xsl:comment>Interlocutor: Hanz Gruber</xsl:comment>
    </xsl:template>
   
   
</xsl:stylesheet>


