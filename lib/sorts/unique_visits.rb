require_relative 'base'

module Sorts
  class UniqueVisits < Base
    NAME = "unique visits"

    def process(page_visit)
      counter[page_visit.path] ||= Hash.new(0)
      counter[page_visit.path][page_visit.ip_address] += 1
    end

    def summary
      result = counter.map.with_object({}) do |(path, ip_addrs), uniq_visits|
        uniq_visits[path] = ip_addrs.length
      end
      result.sort_by { |_path, count| count }.reverse
    end
  end
end
