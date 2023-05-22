class Person
  attr_accessor :partner, :name

  def initialize(name)
    @name = name
  end

  def get_married(person)
    if person.is_a?(Person)
      self.partner = person
      person.partner = self
    else
      raise PartnerError, "Invalid argument. Must be a Person instance."
    end
  end

  class PartnerError < StandardError
    def message
      "Invalid argument. Must be a Person instance."
    end
  end
end

describe Person do
  let(:beyonce) { Person.new("Beyonce") }
  let(:jay_z) { Person.new("Jay-Z") }

  describe "#get_married" do
    context "when passed a Person instance as an argument" do
      it "sets the partners of each person" do
        beyonce.get_married(jay_z)
        expect(beyonce.partner).to be(jay_z)
        expect(jay_z.partner).to be(beyonce)
      end
    end

    context "when passed something other than a Person instance as an argument" do
      it "outputs an error message to the terminal" do
        error_message = "Invalid argument. Must be a Person instance."
        expect { beyonce.get_married("Jay-Z") }.to raise_error(Person::PartnerError, error_message)
      end
    end
  end
end