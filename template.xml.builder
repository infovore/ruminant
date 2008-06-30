xml.moo("xsi:noNamespaceSchemaLocation" => "http://www.moo.com/xsd/api_0.7.xsd") {
  xml.request {
    xml.version self.api_version
    xml.api_key self.api_key
    xml.call "build"
  }
  xml.payload{
    xml.products {
      xml.product {
        xml.product_type self.product_type
        self.designs.each { |design|
          design.to_xml(xml)
        }
      }
    }
  }
}