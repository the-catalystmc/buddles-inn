class ApplicationController < ActionController::Base
    def parse_datetime_params params, label, utc_or_local = :local
        begin
          year   = params[(label.to_s + '(1)').to_sym].to_i
          month  = params[(label.to_s + '(2)').to_sym].to_i
          mday   = params[(label.to_s + '(3)').to_sym].to_i
          hour   = (params[(label.to_s + '(4)').to_sym] || 0).to_i
          minute = (params[(label.to_s + '(5)').to_sym] || 0).to_i
          second = (params[(label.to_s + '(6)').to_sym] || 0).to_i
  
          return DateTime.civil_from_format(utc_or_local,year,month,mday,hour,minute,second)
          
        rescue => e
          return nil
        end
      end
end
