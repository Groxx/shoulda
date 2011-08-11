require 'test_helper'

class SharedContextTest < ActiveSupport::TestCase
  @@normal_setup_called = 0
  @@normal_context_setup_val = nil
  
  @@shared_setup_called = 0
  @@shared_context_setup_val = nil
  
  @@inside_shared_setup_called = 0
  @@inside_shared_context_setup_val = nil
  
  @@sanity_check = false
  
  context "with a setup" do
    setup do
      print "\nensure: should increment top level     : " if @@sanity_check && @@normal_setup_called == 0
      @@normal_setup_called += 1
    end
    # order is not predictable, so just assume.  One might pass incorrectly, but all will not.
    should "increment setup called counter A" do
      assert_equal((@@normal_context_setup_val ||= 0)+1, @@normal_setup_called)
      @@normal_context_setup_val = @@normal_setup_called
      print @@normal_setup_called if @@sanity_check
    end
    should "increment setup called counter B" do
      assert_equal((@@normal_context_setup_val ||= 0)+1, @@normal_setup_called)
      @@normal_context_setup_val = @@normal_setup_called
      print @@normal_setup_called if @@sanity_check
    end
    should "increment setup called counter C" do
      assert_equal((@@normal_context_setup_val ||= 0)+1, @@normal_setup_called)
      @@normal_context_setup_val = @@normal_setup_called
      print @@normal_setup_called if @@sanity_check
    end
    should "increment setup called counter D" do
      assert_equal((@@normal_context_setup_val ||= 0)+1, @@normal_setup_called)
      @@normal_context_setup_val = @@normal_setup_called
      print @@normal_setup_called if @@sanity_check
    end
    should "increment setup called counter E" do
      assert_equal((@@normal_context_setup_val ||= 0)+1, @@normal_setup_called)
      @@normal_context_setup_val = @@normal_setup_called
      print @@normal_setup_called if @@sanity_check
    end
  end
  
  context "with a shared setup" do
    setup do
      print "\nensure: should all == 1 as shared      : " if @@sanity_check && @@shared_setup_called == 0
      @@shared_setup_called += 1
    end
    
    shared_context "" do
      # order is not predictable, so just assume.  One might pass incorrectly, but all will not.
      should "not increment setup called counter A" do
        assert_equal 1, @@shared_setup_called
        print @@shared_setup_called if @@sanity_check
      end
      should "not increment setup called counter B" do
        assert_equal 1, @@shared_setup_called
        print @@shared_setup_called if @@sanity_check
      end
      should "not increment setup called counter C" do
        assert_equal 1, @@shared_setup_called
        print @@shared_setup_called if @@sanity_check
      end
      
      context "and a regular setup within a shared" do
        setup do
          print "\nensure: should increment inside shared : " if @@sanity_check && @@inside_shared_setup_called == 0
          @@inside_shared_setup_called += 1
        end
        # order is not predictable, so just assume.  One might pass incorrectly, but all will not.
        should "increment setup called counter A" do
          assert_equal((@@inside_shared_context_setup_val ||= 0)+1, @@inside_shared_setup_called)
          @@inside_shared_context_setup_val = @@inside_shared_setup_called
          print @@inside_shared_setup_called if @@sanity_check
        end
        should "increment setup called counter B" do
          assert_equal((@@inside_shared_context_setup_val ||= 0)+1, @@inside_shared_setup_called)
          @@inside_shared_context_setup_val = @@inside_shared_setup_called
          print @@inside_shared_setup_called if @@sanity_check
        end
        should "increment setup called counter C" do
          assert_equal((@@inside_shared_context_setup_val ||= 0)+1, @@inside_shared_setup_called)
          @@inside_shared_context_setup_val = @@inside_shared_setup_called
          print @@inside_shared_setup_called if @@sanity_check
        end
        should "increment setup called counter D" do
          assert_equal((@@inside_shared_context_setup_val ||= 0)+1, @@inside_shared_setup_called)
          @@inside_shared_context_setup_val = @@inside_shared_setup_called
          print @@inside_shared_setup_called if @@sanity_check
        end
        should "increment setup called counter E" do
          assert_equal((@@inside_shared_context_setup_val ||= 0)+1, @@inside_shared_setup_called)
          @@inside_shared_context_setup_val = @@inside_shared_setup_called
          print @@inside_shared_setup_called if @@sanity_check
        end
      end
      
      should "not increment setup called counter D" do
        assert_equal 1, @@shared_setup_called
        print @@shared_setup_called if @@sanity_check
      end
      should "not increment setup called counter E" do
        assert_equal 1, @@shared_setup_called
        print @@shared_setup_called if @@sanity_check
      end
    end
  end
end
