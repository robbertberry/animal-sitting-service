module ApplicationHelper
  def flash_classes(type)
    if type.eql?('success')
      'text-green-800 border border-green-300 bg-green-50'
    elsif type.eql?('notice')
      'text-blue-800 border border-blue-300 bg-blue-50'
    else
      'text-red-800 border border-red-300 bg-red-50'
    end
  end
end
