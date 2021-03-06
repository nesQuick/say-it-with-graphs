require 'spec_helper'
require 'say_it_with_graphs/graph_controls'
require 'say_it_with_graphs/frame'

RSpec.describe SayItWithGraphs::GraphControls do

  subject { (Class.new { include SayItWithGraphs::GraphControls }).new }

  describe '#frame' do
    it 'should yield the frame' do
      frame = double 'frame'
      allow(SayItWithGraphs::Frame).to receive(:new).and_return(frame)
      expect { |b| subject.frame(&b) }.to yield_with_args(frame)
    end

    it 'should return all frame' do
      frame1 = double 'frame'
      frame2 = double 'frame'
      allow(SayItWithGraphs::Frame).to receive(:new).and_return(frame1, frame2)
      subject.frame {|f|}
      expect(subject.frame {|f|}.length).to be 2
    end
  end

  describe '#rnd_line' do
    it 'should return random 6 character string to be used as line number' do
      allow(SecureRandom).to receive(:hex).and_return('ba11ade')
      expect(subject.rnd_line).to eq 'ba11ad'
    end
  end
end
