namespace :report do
  # run me with bin/rake report:generate_shipping_info
  desc "Generate customer shipping information"
  task :generate_shipping_info, [:date] => :environment do |task, args|
    attributes = %w(email_address
                    first_name
                    last_name
                    street_line_1
                    street_line_2
                    city
                    region
                    postal_code
                    country)

    shipping_info = ShippingAddress.all

    CSV.generate(headers: true) do |csv|
      csv << attributes

      shipping_info.each do |shipping_info|
        csv << attributes.map { |attribute| shipping_info.send(attribute) }
      end
    end
  end

end
