class SampleProcessTaskHook
  # need to define 'self.execute' so it can be executed
  def self.execute(process_task)
    puts 'this is a service hook'
  end
end
