# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(label:, url: nil, classnames: nil)
    @label = label
    @url = url
    @classnames = 'font-medium text-center text-white bg-blue-600 rounded hover:bg-blue-700 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800 px-5 py-3 text-base' + class_names
  end
end
