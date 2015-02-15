package Map::Tube::Singapore;

# Pragmas.
use strict;
use warnings;
use 5.006;

# Modules.
use File::Share ':all';
use Moo;
use namespace::clean;

# Version.
our $VERSION = 0.01;

# Get XML.
has xml => (
	'is' => 'ro',
	'default' => sub {
		return dist_file('Map-Tube-Singapore', 'singapore-map.xml');
	},
);

with 'Map::Tube';

1;

__END__

=encoding utf8

=head1 NAME

Map::Tube::Singapore - Interface to the Singapore Metro Map.

=head1 SYNOPSIS

 use Map::Tube::Singapore;
 my $obj = Map::Tube::Singapore->new;
 my $routes_ar = $obj->get_all_routes($from, $to);
 my $lines_ar = $obj->get_lines;
 my $station = $obj->get_node_by_id($station_id);
 my $station = $obj->get_node_by_name($station_name);
 my $route = $obj->get_shortest_route($from, $to);
 my $stations_ar = $obj->get_stations($line);
 my $metro_name = $obj->name;
 my $xml_file = $obj->xml;

=head1 DESCRIPTION

It currently provides functionality to find the shortest route between the two
given nodes.

For more information about Singapore Map, click L<here|https://en.wikipedia.org/wiki/Singapore_Metro>.

=head1 METHODS

=over 8

=item C<new()>

 Constructor.

=item C<get_all_routes($from, $to)> [EXPERIMENTAL]

 Get all routes from station to station.
 Returns reference to array with Map::Tube::Route objects.

=item C<get_lines()>

 Get lines in metro map.
 Returns reference to array with Map::Tube::Line objects.

=item C<get_node_by_id($station_id)>

 Get station node by id.
 Returns Map::Tube::Node object.

=item C<get_node_by_name($station_name)>

 Get station node by name.
 Returns Map::Tube::Node object.

=item C<get_shortest_route($from, $to)>

 Get shortest route between $from and $to node names. Node names in $from and $to are case insensitive.
 Returns Map::Tube::Route object.

=item C<get_stations($line)>

 Get list of stations for concrete metro line.
 Returns reference to array with Map::Tube::Node objects.

=item C<name()>

 Get metro name.
 Returns string with metro name.

=item C<xml()>

 Get XML specification of Singapore metro.
 Returns string with XML.

=back

=head1 EXAMPLE1

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Map::Tube::Singapore;

 # Object.
 my $obj = Map::Tube::Singapore->new;

 # Get route.
 my $route = $obj->get_shortest_route('Admiralty', 'Tampines');

 # Print out type.
 print "Route: ".$route."\n";

 # Output:
 # Route: Admiralty (North South MRT Line), Sembawang (North South MRT Line), Canberra (North South MRT Line), Yishun (North South MRT Line), Khatib (North South MRT Line), Yio Chu Kang (North South MRT Line), Ang Mo Kio (North South MRT Line), Bishan (North South MRT Line), Bishan (Circle MRT Line), Lorong Chuan (Circle MRT Line), Serangoon (Circle MRT Line), Bartley (Circle MRT Line), Tai Seng (Circle MRT Line), MacPherson (Circle MRT Line), Paya Lebar (Circle MRT Line), Paya Lebar (East West MRT Line), Eunos (East West MRT Line), Kembangan (East West MRT Line), Bedok (East West MRT Line), Tanah Merah (East West MRT Line), Simei (East West MRT Line), Tampines (East West MRT Line)

=head1 EXAMPLE2

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Map::Tube::Singapore;

 # Object.
 my $obj = Map::Tube::Singapore->new;

 # Get XML file.
 my $xml_file = $obj->xml;

 # Print out XML file.
 print "XML file: $xml_file\n";

 # Output like:
 # XML file: .*/singapore-map.xml

=head1 EXAMPLE3

 # Pragmas.
 use strict;
 use warnings;

 # Modules.
 use Map::Tube::GraphViz;
 use Map::Tube::GraphViz::Utils qw(node_color_without_label);
 use Map::Tube::Singapore;

 # Object.
 my $obj = Map::Tube::Singapore->new;

 # GraphViz object.
 my $g = Map::Tube::GraphViz->new(
         'callback_node' => \&node_color_without_label,
         'driver' => 'neato',
         'tube' => $obj,
 ); 

 # Get graph to file.
 $g->graph('Singapore.png');

 # Print file.
 system "ls -l Singapore.png";

 # Output like:
 # TODO

=begin html

<a href="https://raw.githubusercontent.com/tupinek/Map-Tube-Singapore/master/images/ex3.png">
  <img src="https://raw.githubusercontent.com/tupinek/Map-Tube-Singapore/master/images/ex3.png" alt="Mass Rapid Transit" width="300px" height="300px" />
</a>

=end html

=head1 DEPENDENCIES

L<File::Share>,
L<Map::Tube>,
L<Moo>,
L<namespace::clean>.

=head1 SEE ALSO

L<Map::Tube>,
L<Map::Tube::Graph>,
L<Map::Tube::GraphViz>,
L<Map::Tube::Plugin::Graph>,
L<Map::Tube::Text::Table>,
L<Task::Map::Tube>.

L<Map::Tube::Barcelona>,
L<Map::Tube::Berlin>,
L<Map::Tube::Bucharest>,
L<Map::Tube::Delhi>,
L<Map::Tube::Dnipropetrovsk>,
L<Map::Tube::Kazan>,
L<Map::Tube::Kharkiv>,
L<Map::Tube::Kiev>,
L<Map::Tube::London>,
L<Map::Tube::Minsk>,
L<Map::Tube::Moscow>,
L<Map::Tube::Novosibirsk>,
L<Map::Tube::NYC>,
L<Map::Tube::Prague>,
L<Map::Tube::SaintPetersburg>,
L<Map::Tube::Samara>,
L<Map::Tube::Sofia>,
L<Map::Tube::Tbilisi>,
L<Map::Tube::Tokyo>,
L<Map::Tube::Vienna>,
L<Map::Tube::Warsaw>,
L<Map::Tube::Yekaterinburg>.

=head1 REPOSITORY

L<https://github.com/tupinek/Map-Tube-Singapore>

=head1 AUTHOR

Michal Špaček L<mailto:skim@cpan.org>

L<http://skim.cz>

=head1 LICENSE AND COPYRIGHT

 © 2014-2015 Michal Špaček
 Artistic License
 BSD 2-Clause License

=head1 VERSION

0.01

=cut
