require_relative '../app/bitmap_editor'

describe 'Bitmap Editor Command Line' do

  before do
    # cli is a 'Bitmap Editor Command Line'
    @cli = BitmapEditor.new
  end

  it "reads user input" do
    allow(@cli).to receive(:gets).and_return("X")
    expect(@cli.send(:get_user_input)).to eq('X')
  end
end
