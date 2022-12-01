require "test_helper"

class WorkerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  context "Associations" do
    should have_many(:time_logs)
  end

  describe "#Worker" do

    before do
      @worker = Worker.create(name: "Test", date_of_birth: DateTime.now)
    end

    describe "#generate_token" do
      it "checks worker is valid" do
        assert @worker.valid?
      end

      it "checks identifier is generated" do
        assert @worker.identifier.present?
      end
    end

    describe "#Total Logged Time" do
      before do
        @worker.time_logs.create(start_time: "27/11/2022-13:00", end_time: "27/11/2022-16:00")
        @worker.time_logs.create(start_time: "27/11/2022-16:30", end_time: "27/11/2022-20:00")

        @worker.time_logs.create(start_time: "28/11/2022-13:00", end_time: "28/11/2022-16:00")
        @worker.time_logs.create(start_time: "28/11/2022-16:30", end_time: "28/11/2022-20:00")
      end

      it "checks total time logged for a worker" do
        assert_equal "13:00:00", @worker.logged_time
      end

      it "returns total time logged after certain date if start_date is provided" do
        assert_equal "06:30:00", @worker.logged_time(DateTime.parse("28/11/2022"))
        assert_equal "13:00:00", @worker.logged_time(DateTime.parse("27/11/2022"))
      end

      describe "#Total between certain date range" do
        it "returns total time logged between specific t" do
          assert_equal "06:30:00", @worker.logged_time(DateTime.parse("27/11/2022"), DateTime.parse("27/11/2022"))
          assert_equal "06:30:00", @worker.logged_time(DateTime.parse("28/11/2022"), DateTime.parse("28/11/2022"))
        end
      end
    end
  end
end
