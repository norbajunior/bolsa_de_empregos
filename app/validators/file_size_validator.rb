class FileSizeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if options[:less_than]
      if record.public_send(attribute).size > options[:less_than]
        record.errors.add(attribute, :less_than, count: file_size_in_megabytes(options[:less_than]))
      end
    end
  end

  private

  def file_size_in_megabytes(size)
    "#{size / 1024 / 1024}MB"
  end
end
