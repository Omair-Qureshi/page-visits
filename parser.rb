# Your code here :)
class LogAnalyzer
# Receives a log as argument
  def initialize(log)
    @log = log
  end
# Write a method with most page visits
  def most_page_visits
    page_visits = {}
  # Use a loop to go through each line in the file
    File.foreach(@log) do |line|
      page = line.split(' ')[0]
  # If there is a page visit add 1, otherwise equal 1
      if page_visits.key?(page)
        page_visits[page] += 1
      else
        page_visits[page] = 1
      end
    end
    # Sort the code ordered from most pages visits to less page visits.
    return page_visits.sort_by { |_, count| -count }
  end

  def most_unique_page_visits
    page_visits = {}
  # Use a loop to go through each line in the file
    File.foreach(@log) do |line|
      page, ip = line.split(' ')
  # If the page visits contains key(page), push ip address in the hash
      if page_visits.key?(page)
        page_visits[page] << ip
      else
        page_visits[page] = [ip]
      end
    end
  # modify the hash and remove duplicates of ip
    page_visits.transform_values! { |ips| ips.uniq.count }
  # page visits order from more to less
    page_visits.sort_by { |_, visits| -visits }
  end
end
