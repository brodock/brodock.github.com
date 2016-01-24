require 'lib/deep_struct'

module Curriculum
  module Helpers
    def mail_to(email, options = {})
      content_tag('a', options.merge(href: "mailto:#{email}")) do
        email
      end
    end

    def skype_to(skype_handler, options = {})
      content_tag('a', options.merge(href: "skype:#{skype_handler}")) do
        "Skype: #{skype_handler}"
      end
    end

    def group_columns(num_columns, itens)
      output = []
      itens.each_with_index do |item, index|
        output[(index % num_columns)] ||= []
        output[(index % num_columns)] << item
      end
      output
    end

    def group_columns_max(num_columns, itens)
      max = itens.count / num_columns
      max += 1 if itens.count % num_columns != 0
      max
    end

    def curriculum
      locale = I18n.locale.to_sym
      file = "curriculum-#{locale}"
      @curriculum ||= DeepStruct.new(YAML.load(File.read("data/#{file}.yml")))
    end
  end
end
