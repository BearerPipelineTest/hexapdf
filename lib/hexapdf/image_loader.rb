# -*- encoding: utf-8; frozen_string_literal: true -*-
#
#--
# This file is part of HexaPDF.
#
# HexaPDF - A Versatile PDF Creation and Manipulation Library For Ruby
# Copyright (C) 2014-2018 Thomas Leitner
#
# HexaPDF is free software: you can redistribute it and/or modify it
# under the terms of the GNU Affero General Public License version 3 as
# published by the Free Software Foundation with the addition of the
# following permission added to Section 15 as permitted in Section 7(a):
# FOR ANY PART OF THE COVERED WORK IN WHICH THE COPYRIGHT IS OWNED BY
# THOMAS LEITNER, THOMAS LEITNER DISCLAIMS THE WARRANTY OF NON
# INFRINGEMENT OF THIRD PARTY RIGHTS.
#
# HexaPDF is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU Affero General Public
# License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with HexaPDF. If not, see <http://www.gnu.org/licenses/>.
#
# The interactive user interfaces in modified source and object code
# versions of HexaPDF must display Appropriate Legal Notices, as required
# under Section 5 of the GNU Affero General Public License version 3.
#
# In accordance with Section 7(b) of the GNU Affero General Public
# License, a covered work must retain the producer line in every PDF that
# is created or manipulated using HexaPDF.
#++

module HexaPDF

  # == Overview
  #
  # An *image loader* is used for loading an image and creating a suitable PDF object. Since some
  # image information needs to be present in the PDF object itself (like height and width) the
  # loader needs to parse the image to get the needed data.
  #
  #
  # == Implementation of an Image Loader
  #
  # Each image loader is a (stateless) object (normally a module) that responds to two methods:
  #
  # handles?(file_or_io)::
  #     Should return +true+ if the given file or IO stream can be handled by the loader, i.e. if
  #     the content contains a suitable image.
  #
  # load(document, file_or_io)::
  #     Should add a new image XObject to the document that uses the file or IO stream as source
  #     and return this newly created object. This method is only invoked if #handles? has
  #     returned +true+ for the same +file_or_io+ object.
  #
  # The image XObject may use any implemented filter. For example, an image loader for JPEG files
  # would typically use the DCTDecode filter instead of decoding the image itself.
  #
  # See: PDF1.7 s8.9
  module ImageLoader

    autoload(:JPEG, 'hexapdf/image_loader/jpeg')
    autoload(:PNG, 'hexapdf/image_loader/png')
    autoload(:PDF, 'hexapdf/image_loader/pdf')

  end

end
