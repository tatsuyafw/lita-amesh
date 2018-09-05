# frozen_string_literal: true

require 'spec_helper'

describe Lita::Handlers::Amesh::Handler, lita_handler: true do
  it { is_expected.to route_command('amesh').to(:amesh) }
end
