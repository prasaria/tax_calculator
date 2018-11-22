class Errors
  class ValidationError < StandardError

    attr_reader :code, :status, :errors

    def initialize(errors)
      @code = Errors::VALIDATION_CODE
      @status = :unprocessable_entity
      @errors = errors

      super(
        code: @code,
        status: @status,
        #message: I18n.t('errors.validation.title'),
        errors: @errors
      )
    end
  end 
end