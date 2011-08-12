require 'test_helper'

class SharedContextTest < ActiveSupport::TestCase
  @@normal_setup_called = 0
  @@normal_context_setup_val = nil
  
  @@shared_setup_called = 0
  @@inner_shared_setup_called = 0
  
  @@sanity_check = true
  
  context "with a setup" do
    setup do
      print "\nensure: should increment top level     : " if @@sanity_check && @@normal_setup_called == 0
      @@normal_setup_called += 1
      @has_run = true
    end
    # order is not predictable, so just assume.  One might pass incorrectly, but all will not.
    should "increment setup called counter A" do
      print "  #{@@normal_setup_called}" if @@sanity_check
      assert_equal((@@normal_context_setup_val ||= 0)+1, @@normal_setup_called)
      @@normal_context_setup_val = @@normal_setup_called
    end
    should "increment setup called counter B" do
      print "  #{@@normal_setup_called}" if @@sanity_check
      assert_equal((@@normal_context_setup_val ||= 0)+1, @@normal_setup_called)
      @@normal_context_setup_val = @@normal_setup_called
    end
    should "increment setup called counter C" do
      print "  #{@@normal_setup_called}" if @@sanity_check
      assert_equal((@@normal_context_setup_val ||= 0)+1, @@normal_setup_called)
      @@normal_context_setup_val = @@normal_setup_called
    end
    should "increment setup called counter D" do
      print "  #{@@normal_setup_called}" if @@sanity_check
      assert_equal((@@normal_context_setup_val ||= 0)+1, @@normal_setup_called)
      @@normal_context_setup_val = @@normal_setup_called
    end
    should "increment setup called counter E" do
      print "  #{@@normal_setup_called}" if @@sanity_check
      assert_equal((@@normal_context_setup_val ||= 0)+1, @@normal_setup_called)
      @@normal_context_setup_val = @@normal_setup_called
    end
  end
  
  context "with a shared setup" do
    setup do
      print "\nensure: should all == 1 as shared      : " if @@sanity_check && @@shared_setup_called == 0
      @@shared_setup_called += 1
      @inner_has_run = 1
    end
    
    shared_context "" do
      setup do
        @@inner_shared_setup_called += 1
        @shared_has_run = 1
      end
      
      # order is not predictable, so just assume.  One might pass incorrectly, but all will not.
      should "not increment setup called counter A" do
        print "#{@@shared_setup_called}.#{@@inner_shared_setup_called}" if @@sanity_check
        assert_equal 1, @@shared_setup_called
        assert_equal 1, @@inner_shared_setup_called
        assert_not_nil @inner_has_run, "parent scope was not carried through!"
        assert_not_nil @shared_has_run, "shared setup scope was not carried through!"
      end
      should "not increment setup called counter B" do
        print "#{@@shared_setup_called}.#{@@inner_shared_setup_called}" if @@sanity_check
        assert_equal 1, @@shared_setup_called
        assert_equal 1, @@inner_shared_setup_called
        assert_not_nil @inner_has_run, "parent scope was not carried through!"
        assert_not_nil @shared_has_run, "shared setup scope was not carried through!"
      end
      should "not increment setup called counter C" do
        print "#{@@shared_setup_called}.#{@@inner_shared_setup_called}" if @@sanity_check
        assert_equal 1, @@shared_setup_called
        assert_equal 1, @@inner_shared_setup_called
        assert_not_nil @inner_has_run, "parent scope was not carried through!"
        assert_not_nil @shared_has_run, "shared setup scope was not carried through!"
      end
      should "not increment setup called counter D" do
        print "#{@@shared_setup_called}.#{@@inner_shared_setup_called}" if @@sanity_check
        assert_equal 1, @@shared_setup_called
        assert_equal 1, @@inner_shared_setup_called
        assert_not_nil @inner_has_run, "parent scope was not carried through!"
        assert_not_nil @shared_has_run, "shared setup scope was not carried through!"
      end
      should "not increment setup called counter E" do
        print "#{@@shared_setup_called}.#{@@inner_shared_setup_called}" if @@sanity_check
        assert_equal 1, @@shared_setup_called
        assert_equal 1, @@inner_shared_setup_called
        assert_not_nil @inner_has_run, "parent scope was not carried through!"
        assert_not_nil @shared_has_run, "shared setup scope was not carried through!"
      end
    end
  end
end