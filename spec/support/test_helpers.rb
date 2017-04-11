def sample_params
  ActionController::Parameters.new(
    {
      'draw' => '1',
      'columns' => {
        '0' => {
          'data' => 'username', 'name' => '', 'searchable' => 'true', 'orderable' => 'true',
          'search' => {
            'value' => '', 'regex' => 'false'
          }
        },
        '1' => {
          'data' => 'email', 'name' => '', 'searchable' => 'true', 'orderable' => 'true',
          'search' => {
            'value' => '', 'regex' => 'false'
          }
        },
        '2' => {
          'data' => 'first_name', 'name' => '', 'searchable' => 'false', 'orderable' => 'false',
          'search' => {
            'value' => '', 'regex' => 'false'
          }
        },
        '3' => {
          'data' => 'last_name', 'name' => '', 'searchable' => 'true', 'orderable' => 'true',
          'search' => {
            'value' => '', 'regex' => 'false'
          }
        },
      },
      'order' => {
        '0' => {'column' => '0', 'dir' => 'asc'}
      },
      'start' => '0', 'length' => '10', 'search' => {
        'value' => '', 'regex' => 'false'
      },
      '_' => '1423364387185'
    }
  )
end

class SampleDatatable < AjaxDatatablesRails::Base
  def view_columns
    @view_columns ||= ['User.username', 'User.email', 'User.first_name', 'User.last_name']
  end

  def data
    [{}, {}]
  end

  def get_raw_records
    User.all
  end
end

class ComplexDatatable < SampleDatatable
  def view_columns
    @view_columns ||= {
      username:   { source: 'User.username' },
      email:      { source: 'User.email' },
      first_name: { source: 'User.first_name' },
      last_name:  { source: 'User.last_name', formater: -> (o) { o.upcase }  }
    }
  end
end

class ComplexDatatableHash < ComplexDatatable
  def data
    records.map do |record|
      {
        username:   record.username,
        email:      record.email,
        first_name: record.first_name,
        last_name:  record.last_name,
      }
    end
  end
end

class ComplexDatatableArray < ComplexDatatable
  def data
    records.map do |record|
      [
        record.username,
        record.email,
        record.first_name,
        record.last_name,
      ]
    end
  end
end