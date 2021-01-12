@extends('admin.shop.layout')

@section('css')
<!-- overlayScrollbars -->
<link rel="stylesheet" href="/admin_panel/dist/css/adminlte.min.css">
@endsection



@section('header')
<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>{{ $product->title }}</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item"><a href="#">Products</a></li>
          <li class="breadcrumb-item active">{{ $product->title }}</li>
        </ol>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>
@endsection


@section('content')
<!-- Main content -->
<section class="content">
  <div class="row">
    <div class="col-md-12 text-right">
      <a href="#" class="btn btn-success">Edit</a>
    </div>
  </div>
  <h5 class="mt-4 mb-2">Title & Description</h5>
  <div class="row">
    <div class="col-md-8 text-center">
      <!-- Default box -->
      <div class="card card-solid">
        <div class="card-body">
          <div class="row">
            <div class="col-6 col-sm-12">
              <h3 class="my-3">{{ $product->title }}</h3>
              <p>{{ $product->description }}</p>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->
    </div>
    <div class="col-md-4">
      

      <div class="card card-solid">
        <div class="card-body">
          <div class="row">
            <div class="col-md-12">
              <h4 class="text-center">Product Status</h4>
              <hr>
              <div class="row mx-auto">
                <div class="col-md-12">
                  
                  <!-- Button trigger modal -->
                  <a href="#"  data-toggle="modal" data-target="#exampleModa2" class="text-gray d-inline float-right"><i class="fas fa-cog"></i></a>
                  <h4 class=" text-center" style="color: {{ $product->status->color }}; ">{{ $product->status->name }}</h4>


                  <!-- Modal -->
                  <form action="#" method="POST">
                    {{method_field('PUT')}}
                    {{csrf_field()}}
                    <div class="modal fade" id="exampleModa2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                      <div class="modal-dialog" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h3 class="modal-title" id="exampleModalLabel">Change Product Status</h3>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">              
                            @foreach($product_statuses as $status)
                            <div class="form-group">
                              <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" value="{{$status->id}}" style="height:15px; width:15px;" {{ $product->status->id == $status->id ? 'checked' : '' }}>
                                <label class="form-check-label" style="margin-left: 15px; margin-top: -2px; font-size: 1.2em; color: {{$status->color}};">{{$status->name}}</label>
                              </div>
                            </div>
                            <hr>
                            @endforeach
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submot" class="btn btn-primary">Save changes</button> 
                            {{-- onclick="return confirm('Are you sure you want to change the Product status?')" --}}
                          </div>
                        </div>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
      <!-- /.card -->


    </div>
  </div>


  <div class="row">
    <div class="col-md-3 text-center">
      <div class="card card-outline card-primary">
        <div class="card-header">
          <h3 class="card-title">SKU</h3>
          <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          {{ $product->sku }}
        </div>
        <!-- /.card-body -->
      </div>
    </div>
    <div class="col-md-3 text-center">
      <div class="card card-outline card-primary">
        <div class="card-header">
          <h3 class="card-title">Brand</h3>
          <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          {{ $product->brand->name }}
        </div>
        <!-- /.card-body -->
      </div>
    </div>
    <div class="col-md-3 text-center">
      <div class="card card-outline card-primary">
        <div class="card-header">
          <h3 class="card-title">Section & Category</h3>
          <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          {{ $product->section->name }} / {{ $product->category->name }} / {{ $product->subcategory->name }}
        </div>
        <!-- /.card-body -->
      </div>
    </div>
    <div class="col-md-3 text-center">
      <div class="card card-outline card-primary">
        <div class="card-header">
          <h3 class="card-title">Gender & Age</h3>
          <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          {{ $product->gender->name }} <br>
          From: ({{ $product->min_age }})  To: (6years) 
        </div>
        <!-- /.card-body -->
      </div>
    </div>
    <div class="col-md-3 text-center">
      <div class="card card-outline card-danger">
        <div class="card-header">
          <h3 class="card-title">Running Cost Percentage</h3>
          <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          3%
        </div>
        <!-- /.card-body -->
      </div>
    </div>
    <div class="col-md-3 text-center">
      <div class="card card-outline card-danger">
        <div class="card-header">
          <h3 class="card-title">Taxes Percentage</h3>
          <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          14%
        </div>
        <!-- /.card-body -->
      </div>
    </div>
  </div>

  <h5 class="mt-4 mb-2">Variants</h5>

  @foreach($product->variants as $variant)
  <div class="row">
    <div class="col-md-12">
      <div class="card card-outline card-primary">
        <div class="card-header">
          <h3 class="card-title">ID: <span style="color: darkred;">{{ $variant->id }}</span></h3>
          <!-- /.card-tools -->
        </div>
        <!-- /.card-header -->
        <div class="card-body">
          <div class="row">
            <div class="col-md-1">
              <h4>Color</h4>
              <div class="btn-group">
                <label class="btn btn-default text-center active">
                  {{ $variant->color->name }}
                  <br>
                  <i class="fas fa-circle fa-2x" style="margin-top: 13px; color: {{ $variant->color->code }};"></i>
                </label>
              </div>
            </div>
            <div class="col-md-1">
              <h4>Size</h4>
              <div class="btn-group">
                <label class="btn btn-default text-center">
                  <span class="text-xl">{{ $variant->size->short_name }}</span>
                  <br>
                  {{ $variant->size->name }}
                </label>
              </div>
            </div>
            <div class="col-md-10 text-right">
              <!-- Button trigger modal -->
              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#edit-attr-modal-{{ $variant->id }}">
                Edit
              </button>
              <!-- Modal -->
              <div class="modal fade text-left" id="edit-attr-modal-{{ $variant->id }}">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">Edit Product Attributes</h4>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form method="POST" action="{{ route('admin_shop_products_updateAttr', [$product->id, $variant->id]) }}">
                      @csrf
                      @method('PUT')
                      <div class="modal-body">
                        <div class="form-group">
                          <label>Color</label>
                          <select class="form-control" name="color">
                            <option value="{{ $variant->color->id }}" selected>{{ $variant->color->name }}</option>
                            @foreach($colors as $color)
                            <option value="{{ $color->id }}">{{ $color->name }}</option>
                            @endforeach
                          </select>
                        </div>
                        <div class="form-group">
                          <label>Size</label>
                          <select class="form-control" name="size">
                            <option value="{{ $variant->size->id }}" selected>{{ $variant->size->name }}</option>
                            @foreach($sizes as $size)
                            <option value="{{ $size->id }}">{{ $size->name }}</option>
                            @endforeach
                          </select>
                        </div>
                      </div>
                      <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                      </div>
                    </form>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- /.modal -->
            </div>
          </div>
          <hr>
          <h5 class="mt-4 mb-2">Images</h5>
          <div class="row">
            @foreach($variant->images as $image)
            <div class="col-md-2">
              <img src="{{ $image->image }}" alt="Product Image" style="width: 100px; object-fit: contain;">
              <hr>
              <form method="POST" action="{{ route('admin_shop_products_remove_image', [$product->id, $variant->id]) }}">
                @csrf
                @method('DELETE')
                <input type="hidden" name="image" value="{{ $image->id }}">
                <button class="btn btn-danger" type="submit" onclick="return confirm('Are you sure you want to delete this image?')"><i class="fas fa-times-circle"></i> Remove</button>
              </form>
            </div>
            @endforeach
            <div class="col-md-2">
              <!-- Button trigger modal -->
              <a href="#" data-toggle="modal" data-target="#add-images-{{ $variant->id }}" style="font-size: 100px;"><i class="fas fa-plus-circle"></i></a>
              <!-- Modal -->
              <div class="modal fade text-left" id="add-images-{{ $variant->id }}">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">Add Images</h4>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form method="POST" action="{{ route('admin_shop_products_add_images', [$product->id, $variant->id]) }}" enctype="multipart/form-data">
                      @csrf
                      <div class="modal-body">
                        <div class="form-group">
                          <label>Add More Images</label>
                          <div class="input-group">
                            <div class="custom-file">
                              <input type="file" class="custom-file-input" name="images[]" id="images" aria-describedby="inputGroupFileAddon01" multiple>
                              <label class="custom-file-label" for="images">Choose file</label>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                      </div>
                    </form>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- /.modal -->
            </div>
          </div>
          <hr>
          <h5 class="mt-4 mb-2">Vendors & Stocks</h5>
          <div class="row">
            <div class="col-md-12 text-center">
              <table class="table table-bordered">
                <thead>                  
                  <tr>
                    <th>Vendor</th>
                    <th>Stock Qty</th>
                    <th>Price</th>
                    <th>Vendor Discount</th>
                    <th>Vendor Price</th>
                    <th>Running Cost</th>
                    <th>Our Discount</th>
                    <th>Subtotal</th>
                    <th>Tax</th>
                    <th>Final Total</th>
                    <th>Actions</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($variant->stocks as $stock)
                  <tr>
                    <td>
                       <img src="/images/vendors/1.png" alt="Product Image" style="width: 50px; object-fit: contain;">
                       <h6>Jumbo Stores</h6>
                    </td>
                    <td>{{ $stock->stock }}</td>
                    <td>{{ $stock->price }} LE</td>
                    <td>-{{ round($stock->price * $stock->vendor_discount_percentage / 100) }} LE ({{ $stock->vendor_discount_percentage }}%)</td>
                    <td>{{ $stock->vendor_price($stock->id) }} LE</td>
                    <td>{{ $stock->running_cost_value($stock->id) }} LE ({{ $product->product_running_cost_percentage_id }}%)</td>
                    <td>-{{ $stock->our_discount_value($stock->id) }} LE ({{ $stock->our_discount_percentage }}%)</td>
                    <td style="color: darkgreen;">{{ $stock->total($stock->id) }} LE</td>
                    <td>{{ $stock->taxes_value($stock->id) }} LE ({{ $product->product_taxes_percentage }}%)</td>
                    <td style="color: darkred;">{{ $stock->final_total($stock->id) }} LE</td>
                    <td>
                      {{-- Modal Button --}}
                      <a href="#" class="btn btn-warning" data-toggle="modal" data-target="#edit-stock-{{ $stock->id }}">Edit</a>
                      <!-- Modal -->
                      <div class="modal fade text-left" id="edit-stock-{{ $stock->id }}">
                        <div class="modal-dialog">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h4 class="modal-title">Edit Stock & Prices</h4>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <form method="POST" action="{{ route('admin_shop_products_updateStock', [$stock->id]) }}">
                              @csrf
                              @method('PUT')
                              <div class="modal-body">
                                <h2 class="text-center">{{ $stock->vendor->name }}</h2>
                                <div class="form-group">
                                  <div class="form-group">
                                    <label for="stock_qty">Stock Quantity</label>
                                    <input type="number" class="form-control" id="stock_qty" name="stock_qty" value="{{ $stock->stock }}" required>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="form-group">
                                    <label for="stock_qty">Price (EGP)</label>
                                    <input type="number" class="form-control" id="stock_qty"  name="price" value="{{ $stock->price }}" required>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="form-group">
                                    <label for="stock_qty">Revenue Percentage (%)</label>
                                    <input type="number" class="form-control" id="stock_qty" name="product_revenue_percentage" value="{{ $stock->product_revenue_percentage_id }}" required>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="form-group">
                                    <label for="stock_qty">Vendor Discount Percentage (%)</label>
                                    <input type="number" class="form-control" id="stock_qty" name="vendor_discount_percentage" value="{{ $stock->vendor_discount_percentage }}" required>
                                  </div>
                                </div>
                                <div class="form-group">
                                  <div class="form-group">
                                    <label for="stock_qty">Our Discount Percentage (%)</label>
                                    <input type="number" class="form-control" id="stock_qty" name="our_discount_percentage" value="{{ $stock->our_discount_percentage }}" required>
                                  </div>
                                </div>
                              </div>
                              <div class="modal-footer justify-content-between">
                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                              </div>
                            </form>
                          </div>
                          <!-- /.modal-content -->
                        </div>
                        <!-- /.modal-dialog -->
                      </div>
                      <!-- /.modal -->
                    </td>
                  </tr>
                  @endforeach
                </tbody>
              </table>
              {{-- Modal Button --}}
              <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#create-new-stock-{{ $variant->id }}">Add New Stock</a>
              <!-- Modal -->
              <div class="modal fade text-left" id="create-new-stock-{{ $variant->id }}">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h4 class="modal-title">Edit Stock & Prices</h4>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <form method="POST" action="{{ route('admin_shop_stocks_store', [$product->id, $variant->id]) }}">
                      @csrf
                      <div class="modal-body">
                        <div class="form-group">
                          <label>Vendor</label>
                          <select class="form-control" name="vendor" required>
                            @foreach($vendors as $vendor)
                            <option value="{{ $vendor->id }}">{{ $vendor->name }}</option>
                            @endforeach
                          </select>
                        </div>
                        <div class="form-group">
                          <div class="form-group">
                            <label for="stock_qty">Stock Quantity</label>
                            <input type="number" class="form-control" id="stock_qty" name="stock_qty" required>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="form-group">
                            <label for="stock_qty">Price (EGP)</label>
                            <input type="number" class="form-control" id="stock_qty"  name="price" required>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="form-group">
                            <label for="stock_qty">Revenue Percentage (%)</label>
                            <input type="number" class="form-control" id="stock_qty" name="product_revenue_percentage" required>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="form-group">
                            <label for="stock_qty">Vendor Discount Percentage (%)</label>
                            <input type="number" class="form-control" id="stock_qty" name="vendor_discount_percentage" required>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="form-group">
                            <label for="stock_qty">Our Discount Percentage (%)</label>
                            <input type="number" class="form-control" id="stock_qty" name="our_discount_percentage" required>
                          </div>
                        </div>
                      </div>
                      <div class="modal-footer justify-content-between">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                      </div>
                    </form>
                  </div>
                  <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
              </div>
              <!-- /.modal -->
            </div>
          </div>
        </div>
        <!-- /.card-body -->
      </div>
    </div>
  </div> 
  @endforeach

</section>
<!-- /.content -->

@endsection




@section('js')
@endsection

