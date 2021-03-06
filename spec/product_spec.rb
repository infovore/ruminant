require File.join(File.dirname(__FILE__), *%w[spec_helper])

describe "The Design base class" do
  before :each do
    @design = Moo::Design.new(:url => "http://farm3.static.flickr.com/2300/2179038972_23d2a1ff40_o.jpg")
    @design.stub!(:product_type).and_return("minicard")

    @design.text = "This is Line 1\nAnd this is the second line"
  end
  
  it "should include the design's photo url" do
    @design.to_xml.should include("<url>http://farm3.static.flickr.com/2300/2179038972_23d2a1ff40_o.jpg</url>")
  end
  
  it "should store the text into multiple TextLines" do
    @design.line(1).class.should == Moo::TextLine
    @design.line(1).string.should == "This is Line 1"
    @design.line(2).class.should == Moo::TextLine
    @design.line(2).string.should == "And this is the second line"
  end
  
  it "should be able to set an attribute on all lines" do
    @design.line(1).bold.should == false
    @design.line(2).bold.should == false
    @design.bold = true
    @design.line(1).bold.should == true
    @design.line(2).bold.should == true
  end
  
  it "should have a text_collection element when converted to xml" do
    @design.to_xml.should include("<text_collection>")
  end
  
  it "should have a text_line element when converted to xml" do
    @design.to_xml.should include("<text_line>")
  end
end

describe  "The Sticker subclass" do
  before(:each) do
    @design = Moo::Sticker.new(:url => "http://farm3.static.flickr.com/2300/2179038972_23d2a1ff40_o.jpg")
  end
  
  it "should not have a text_collection element when converted to xml" do
    @design.to_xml.should_not include("<text_collection>")
  end
end