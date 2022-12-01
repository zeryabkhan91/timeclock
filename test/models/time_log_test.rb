require "test_helper"

class TimeLogTest < ActiveSupport::TestCase

  context "Associations" do
    should belong_to(:worker)
    should validate_presence_of(:start_time)
    should validate_presence_of(:end_time)
  end

  describe "#timelog" do

    before do
      worker = Worker.create(name: "Test", date_of_birth: DateTime.now)
      @timeLog = worker.time_logs.create(start_time: "27/11/2022-13:00", end_time: "27/11/2022-16:00")
      @invalid_timelog1 = worker.time_logs.create(start_time: "27/11/2022-13:00")
      @invalid_timelog2 = worker.time_logs.create(end_time: "27/11/2022-13:00")
      @invalid_timelog3 = worker.time_logs.create(start_time: "27/11/2022-13:00", end_time: "27/11/2022-12:00")
    end

    it "should be valid" do
      assert @timeLog.valid?
    end

    it "should be invalid without end_time" do
      refute @invalid_timelog1.valid?
    end

    it "should be invalid without start_time" do
      refute @invalid_timelog2.valid?
    end

    it "should be invalid because end_time is less than start_time" do
      refute @invalid_timelog3.valid?
    end

    it "should calculate total_time between start_time and end_time" do
      assert 180, @timelog.total_time
    end
  end
end
