require "spec_helper"

describe Mongoid::Persistence::Insert do

  let(:document) do
    Patient.new(:title => "Mr")
  end

  let(:collection) do
    stub.quacks_like(Mongoid::Collection.allocate)
  end

  before do
    document.stubs(:collection).returns(collection)
  end

  describe "#initialize" do

    let(:insert) do
      Mongoid::Persistence::Insert.new(document)
    end

    it "sets the document" do
      insert.document.should == document
    end

    it "sets the collection" do
      insert.collection.should == document.collection
    end

    it "defaults validation to true" do
      insert.validate.should == true
    end

    it "sets the options" do
      insert.options.should ==
        { :safe => Mongoid.persist_in_safe_mode }
    end
  end

  describe "#persist" do

    def root_set_expectation
      lambda {
        collection.expects(:insert).with(
          document.raw_attributes,
          :safe => true
        ).returns("Object")
      }
    end

    let(:insert) do
      Mongoid::Persistence::Insert.new(document)
    end

    context "when the document is valid" do

      it "inserts the new document" do
        root_set_expectation.call
        insert.persist
      end

      it "returns the document" do
        root_set_expectation.call
        insert.persist.should == document
      end

      it "sets new_record to false" do
        root_set_expectation.call
        insert.persist
        document.new_record?.should == false
      end
    end

    context "when the document is not valid" do

      before do
        document.stubs(:valid?).returns(false)
      end

      it "returns the document" do
        insert.persist.should == document
      end

      it "leaves the document as a new record" do
        insert.persist
        document.new_record?.should == true
      end
    end

    context "when not validating" do

      before do
        insert.instance_variable_set(:@validate, false)
        document.stubs(:valid?).returns(false)
      end

      after do
        insert.instance_variable_set(:@validate, true)
      end

      it "inserts the document in the database" do
        root_set_expectation.call
        insert.persist
        document.new_record?.should == false
      end
    end

    context "when the document is embedded" do

      context "when the embedded document is an embeds_one" do

        context "when the parent is new" do

          it "inserts the parent"

        end

        context "when the parent is not new" do

          it "performs an in place $set on the embedded document"
        end
      end

      context "when the embedded document is an embeds_many" do

        context "when the parent is new" do

          it "inserts the parent"
        end

        context "when the parent is not new" do

          it "performs a $push on the embedded array"
        end
      end
    end
  end
end