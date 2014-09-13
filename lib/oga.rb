require 'ast'
require 'set'
require 'stringio'

require_relative 'oga/version'
require_relative 'oga/oga'

# Load these first so that the native extensions don't have to define the
# Oga::XML namespace.
require_relative 'oga/xml/lexer'
require_relative 'oga/xml/parser'

require_relative 'liboga'

#:nocov:
if RUBY_PLATFORM == 'java'
  org.liboga.Liboga.load(JRuby.runtime)
end
#:nocov:

require_relative 'oga/xml/querying'
require_relative 'oga/xml/traversal'
require_relative 'oga/xml/node'
require_relative 'oga/xml/document'
require_relative 'oga/xml/character_node'
require_relative 'oga/xml/text'
require_relative 'oga/xml/comment'
require_relative 'oga/xml/cdata'
require_relative 'oga/xml/xml_declaration'
require_relative 'oga/xml/processing_instruction'
require_relative 'oga/xml/doctype'
require_relative 'oga/xml/namespace'
require_relative 'oga/xml/attribute'
require_relative 'oga/xml/element'
require_relative 'oga/xml/node_set'

require_relative 'oga/xml/pull_parser'
require_relative 'oga/html/parser'

require_relative 'oga/xpath/node'
require_relative 'oga/xpath/lexer'
require_relative 'oga/xpath/parser'
require_relative 'oga/xpath/evaluator'
