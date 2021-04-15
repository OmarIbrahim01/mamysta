@extends('admin.shop.layout')

@section('css')
@endsection



@section('header')
<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Orders</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active">Orders</li>
        </ol>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>
@endsection


@section('content')
<!-- Main content -->
<section class="content">
  <div class="container-fluid">
    <div class="row">
      {{-- Filters --}}
      <div class="col-md-12">
      </div>
    </div>
    <div class="row">
      <div class="col-md-12">
        <div class="card">
          <div class="card-header">
            <h3 class="card-title">Orders</h3>
          </div>
          <!-- /.card-header -->
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-bordered text-center">
                <thead>                  
                  <tr>
                    <th>#ID</th>
                    <th>Items</th>
                    <th>Customer</th>
                    <th>Created</th>
                    <th>Shipping</th>
                    <th>Total</th>
                    <th>Status</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($orders as $order)
                  <tr>
                    <td class="align-middle">{{ $order->id }}</td>
                    <td class="align-middle">
                      @foreach($order->items as $item)
                      <p>{{ $item->product->title }} ({{ $item->vendor->name }})</p>
                      @endforeach
                    </td>
                    <td class="align-middle">
                      <p>{{ $order->user->name }} {{ $order->user->last_name }}</p>
                    </td>
                    <td class="align-middle">
                      <p>{{ $order->created_at->format('d/m/Y') }}</p>
                      <p>{{ $order->created_at->diffForHumans() }}</p>
                    </td>
                    <td class="align-middle">
                      <p>{{ $order->shipping_method->name }} ({{ $order->shipping_method->days_min }}-{{ $order->shipping_method->days_max }} Days)</p>
                      <p>Expected Delivery: {{ $order->created_at->addDay($order->shipping_method->days_max)->diffForHumans() }} ({{ $order->created_at->addDay($order->shipping_method->days_max)->format('d/m/Y') }})</p>
                      <p>Address: {{ $order->user_address->address }}, {{ $order->user_address->city->name }}, {{ $order->user_address->region->name }}<br>Phone: {{ $order->user_phone->phone }}</p>
                    </td>
                    <td class="align-middle">{{ $order->total($order->id) }} EGP</td>
                    <td class="align-middle">
                      <h6><span class="badge" style="color: white; background-color: {{ $order->status->color }};">{{ $order->status->name }}</span></h6>
                    </td>
                    <td class="align-middle">
                      <a href="#" class="btn btn-primary">View</a>
                    </td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- /.card -->
      </div>
    </div>
  </div>
</section>
@endsection




@section('js')
@endsection

