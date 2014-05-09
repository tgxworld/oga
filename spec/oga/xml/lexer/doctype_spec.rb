require 'spec_helper'

describe Oga::XML::Lexer do
  context 'doctypes' do
    example 'lex the HTML5 doctype' do
      lex('<!DOCTYPE html>').should == [
        [:T_DOCTYPE_START, nil, 1],
        [:T_DOCTYPE_NAME, 'html', 1],
        [:T_DOCTYPE_END, nil, 1]
      ]
    end

    example 'lex a doctype with a public and system ID' do
      lex('<!DOCTYPE HTML PUBLIC "foobar" "baz">').should == [
        [:T_DOCTYPE_START, nil, 1],
        [:T_DOCTYPE_NAME, 'HTML', 1],
        [:T_DOCTYPE_TYPE, 'PUBLIC', 1],
        [:T_STRING, 'foobar', 1],
        [:T_STRING, 'baz', 1],
        [:T_DOCTYPE_END, nil, 1]
      ]
    end

    example 'lex a doctype with a public and system ID using single quotes' do
      lex("<!DOCTYPE HTML PUBLIC 'foobar' 'baz'>").should == [
        [:T_DOCTYPE_START, nil, 1],
        [:T_DOCTYPE_NAME, 'HTML', 1],
        [:T_DOCTYPE_TYPE, 'PUBLIC', 1],
        [:T_STRING, 'foobar', 1],
        [:T_STRING, 'baz', 1],
        [:T_DOCTYPE_END, nil, 1]
      ]
    end

    example 'lex an inline doctype' do
      lex('<!DOCTYPE html [<!ELEMENT foo>]>').should == [
        [:T_DOCTYPE_START, nil, 1],
        [:T_DOCTYPE_NAME, 'html', 1],
        [:T_DOCTYPE_INLINE, '<!ELEMENT foo>', 1],
        [:T_DOCTYPE_END, nil, 1]
      ]
    end

    # Technically not valid, put in place to make sure that the Ragel rules are
    # not too greedy.
    example 'lex an inline doftype followed by a system ID' do
      lex('<!DOCTYPE html [<!ELEMENT foo>] "foo">').should == [
        [:T_DOCTYPE_START, nil, 1],
        [:T_DOCTYPE_NAME, 'html', 1],
        [:T_DOCTYPE_INLINE, '<!ELEMENT foo>', 1],
        [:T_STRING, 'foo', 1],
        [:T_DOCTYPE_END, nil, 1]
      ]
    end
  end
end
