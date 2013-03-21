package MusicBrainz::Server::ControllerBase::ReleaseEditor;
use Moose;
use URI;
use warnings FATAL => 'all';

BEGIN { extends 'MusicBrainz::Server::Controller' }

__PACKAGE__->config(
    namespace => 'release_editor'
);

sub redirect_uri {
    my ($self, $c, $gid) = @_;
    my $redirect_uri = URI->new($c->req->params->{'redirect_uri'});
    my $new_query = 'release_mbid=' . $gid;

    if (!defined $redirect_uri->query || $redirect_uri->query eq '') {
        $redirect_uri->query($new_query);
    } else {
        $redirect_uri->query($redirect_uri->query . '&' . $new_query);
    }
    return $redirect_uri->as_string;
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;

=head1 COPYRIGHT

Copyright (C) 2010 MetaBrainz Foundation

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

=cut
