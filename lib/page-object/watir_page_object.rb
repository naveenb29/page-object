require 'page-object/elements'

module PageObject
  class WatirPageObject
    def initialize(browser)
      @browser = browser      
    end

    def navigate_to(url)
      @browser.goto url
    end
    
    def text
      @browser.text
    end

    def html
      @browser.html
    end

    def title
      @browser.title
    end

    def text_field_value_for(identifier)
      identifier = Elements::TextField.watir_identifier_for identifier
      @browser.text_field(identifier).value
    end
    
    def text_field_value_set(identifier, value)
      identifier = Elements::TextField.watir_identifier_for identifier
      @browser.text_field(identifier).set(value)
    end
    
    def select_list_value_for(identifier)
      identifier = Elements::SelectList.watir_identifier_for identifier
      @browser.select_list(identifier).value
    end
    
    def select_list_value_set(identifier, value)
      identifier = Elements::SelectList.watir_identifier_for identifier
      @browser.select_list(identifier).select(value)
    end
        
    #
    # platform method to click a link
    # See PageObject::Accessors#link
    #
    def click_link_for(identifier)
      identifier = Elements::Link.watir_identifier_for identifier
      @browser.link(identifier).click if identifier
    end
    
    #
    # platform method to return a PageObject::Elements::Link object
    # see PageObject::Accessors#link
    #
    def link_for(identifier)
      identifier = Elements::Link.watir_identifier_for identifier
      element = @browser.link(identifier)
      Elements::Link.new(element, :platform => :watir)
    end

    #
    # platform method to check a checkbox
    # See PageObject::Accessors#checkbox
    #
    def check_checkbox(identifier)
      identifier = Elements::CheckBox.watir_identifier_for identifier
      @browser.checkbox(identifier).set
    end

    #
    # platform method to uncheck a checkbox
    # See PageObject::Accessors#checkbox
    #
    def uncheck_checkbox(identifier)
      identifier = Elements::CheckBox.watir_identifier_for identifier
      @browser.checkbox(identifier).clear
    end

    #
    # platform method to determine if a checkbox is checked
    # See PageObject::Accessors#checkbox
    #
    def checkbox_checked?(identifier)
      identifier = Elements::CheckBox.watir_identifier_for identifier
      @browser.checkbox(identifier).set?
    end
    
    #
    # platform method to return a PageObject::Elements::CheckBox element
    # See PageObject::Accessors#checkbox
    #
    def checkbox_for(identifier)
      identifier = Elements::CheckBox.watir_identifier_for identifier
      element = @browser.checkbox(identifier)
      Elements::CheckBox.new(element, :platform => :watir)
    end

    #
    # platform method to select a radio button
    # See PageObject::Accessors#radio_button
    #
    def select_radio(identifier)
      identifier = Elements::RadioButton.watir_identifier_for identifier
      @browser.radio(identifier).set
    end

    #
    # platform method to clear a radio button
    # See PageObject::Accessors#radio_button
    #
    def clear_radio(identifier)
      identifier = Elements::RadioButton.watir_identifier_for identifier
      @browser.radio(identifier).clear
    end

    #
    # platform method to determine if a radio button is selected
    # See PageObject::Accessors#radio_button
    #
    def radio_selected?(identifier)
      identifier = Elements::RadioButton.watir_identifier_for identifier
      @browser.radio(identifier).set?
    end
    
    #
    # platform method to return a PageObject::Eements::RadioButton element
    # See PageObject::Accessors#radio_button
    #
    def radio_button_for(identifier)
      identifier = Elements::RadioButton.watir_identifier_for identifier
      element = @browser.radio(identifier)
      PageObject::Elements::RadioButton.new(element, :platform => :watir)
    end
  end
end
