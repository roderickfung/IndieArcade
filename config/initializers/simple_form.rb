# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
    config.wrappers :default, class: :input,
                              hint_class: :field_with_hint, error_class: :field_with_errors do |b|
        b.use :html5

        b.use :placeholder

        # Calculates maxlength from length validations for string inputs
        b.optional :maxlength

        # Calculates pattern from format validations for string inputs
        b.optional :pattern

        # Calculates min and max from length validations for numeric inputs
        b.optional :min_max

        # Calculates readonly automatically from readonly attributes
        b.optional :readonly

        ## Inputs
        b.use :label_input
        b.use :hint,  wrap_with: { tag: :span, class: :hint }
        b.use :error, wrap_with: { tag: :span, class: :error }
    end

    config.default_wrapper = :default
    config.boolean_style = :nested

    config.button_class = 'btn'
    config.error_notification_tag = :div

    config.error_notification_class = 'error_notification'
    config.browser_validations = false
    config.boolean_label_class = 'checkbox'
end
