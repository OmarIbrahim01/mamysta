@extends('admin.shop.layout')

@section('css')
<!-- summernote -->
<link rel="stylesheet" href="/admin_panel/plugins/summernote/summernote-bs4.css">
@endsection



@section('header')
<!-- Content Header (Page header) -->
<section class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1>Add New Product</h1>
      </div>
      <div class="col-sm-6">
        <ol class="breadcrumb float-sm-right">
          <li class="breadcrumb-item"><a href="#">Home</a></li>
          <li class="breadcrumb-item active">Add New Product</li>
        </ol>
      </div>
    </div>
  </div><!-- /.container-fluid -->
</section>
@endsection


@section('content')
<form method="POST" action="{{ route('admin_shop_products_store') }}" enctype="multipart/form-data">
  @csrf
  <!-- Main content -->
  <section class="content">
    <div class="container-fluid">
      <div class="row">
        <!-- left column -->
        <div class="col-md-8">
          <!-- Card -->
          <div class="card card-outline card-primary">
            <div class="card-header">
              <h3 class="card-title">Product Info</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <div class="form-group">
                <label for="title">Title</label>
                <input type="text" class="form-control" id="title" placeholder="Product Title" name="title" required>
              </div>
              <div class="form-group">
                <label for="description">Description</label>
                <div class="mb-3">
                  <textarea id="description" placeholder="Product Description" name="description" required></textarea>
                </div>
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          <!-- Card -->
          <div class="card card-outline card-primary">
            <div class="card-header">
              <h3 class="card-title">Variant Info</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <div class="row">
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Color</label>
                    <select class="form-control" name="color" required>
                      <option value="" disabled selected>Select Color</option>
                      @foreach($colors as $color)
                      <option value="{{ $color->id }}">{{ $color->name }}</option>
                      @endforeach
                    </select>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Size</label>
                    <select class="form-control" name="size" required>
                      <option value="" disabled selected>Select Size</option>
                      @foreach($sizes as $size)
                      <option value="{{ $size->id }}">{{ $size->name }}</option>
                      @endforeach
                    </select>
                  </div>
                </div>
                <div class="col-md-12" style="margin-bottom: 15px;">
                  <div class="form-group">
                    <label>Images</label>
                    <div class="input-group">
                      <div class="custom-file">
                        <input type="file" class="custom-file-input" name="images[]" multiple required>
                        <label class="custom-file-label" for="exampleInputFile">Choose Images</label>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-md-12">
                  <div class="card">
                    <div class="card-header">
                      <h3 class="card-title">Inventory & Pricing</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body">
                      <div class="row">
                        <div class="col-md-8">
                          <div class="form-group">
                            <label>Vendor</label>
                            <select class="form-control" name="vendor" required>
                              <option value="" selected disabled>Select Vendor</option>
                              @foreach($vendors as $vendor)
                              <option value="{{ $vendor->id }}">{{ $vendor->name }}</option>
                              @endforeach
                            </select>
                          </div>
                        </div>
                        <div class="col-md-4">
                          <div class="form-group">
                            <label for="stock">Stock Quantity</label>
                            <input type="number" class="form-control" id="stock_qty" name="stock_qty" required>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-3">
                          <div class="form-group">
                            <label>Cost</label>
                            <input type="number" class="form-control" id="price" name="price" required>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label>Vendor Discount</label>
                            <select class="form-control" name="vendor_discount" required>
                              @for($i=0; $i <= 100; $i++)
                              <option value="{{ $i }}">{{ $i }}%</option>
                              @endfor
                            </select>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label>Our Discount</label>
                            <select class="form-control" name="our_discount" required>
                              @for($i=0; $i <= 100; $i++)
                              <option value="{{ $i }}">{{ $i }}%</option>
                              @endfor
                            </select>
                          </div>
                        </div>
                        <div class="col-md-3">
                          <div class="form-group">
                            <label>Revenue Percentage</label>
                            <select class="form-control" name="revenue_percentage" required>
                              <option value="" selected disabled>Select Percentage</option>
                              @for($i=0; $i <= 100; $i++)
                              <option value="{{ $i }}">{{ $i }}%</option>
                              @endfor
                            </select>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="text-center">
                    <small>You can add more variants and vendors after you save the product</small>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          <!-- Card -->
          <div class="card card-outline card-primary">
            <div class="card-header">
              <h3 class="card-title">Product Dimensions</h3>
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <div class="row">
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Length</label>
                    <input type="number" class="form-control" placeholder="Cm" name="length">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Width</label>
                    <input type="number" class="form-control" placeholder="Cm" name="width">
                  </div>
                </div>
                <div class="col-md-4">
                  <div class="form-group">
                    <label>Height</label>
                    <input type="number" class="form-control" placeholder="Cm" name="height">
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="form-group">
                    <label>Weight</label>
                    <input type="number" class="form-control" placeholder="Kg" name="weight">
                  </div>
                </div>
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          <!-- Card -->
        </div>
        <!--/.col (left) -->
        <!-- right column -->
        <div class="col-md-4">
          <!-- Card -->
          <div class="card card-outline card-primary">
            <div class="card-header">
              <h3 class="card-title">Product Status</h3>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label>Status</label>
                <select class="form-control" name="status" required>
                  @foreach($statuses as $status)
                  <option value="{{ $status->id }}">{{ $status->name }}</option>
                  @endforeach
                </select>
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          <!-- Card -->
          <div class="card card-outline card-primary">
            <div class="card-header">
              <h3 class="card-title">Product Brand</h3>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label>Brand</label>
                <select class="form-control" name="brand" required>
                  <option value="" selected disabled>Select Brand</option>
                  @foreach($brands as $brand)
                  <option value="{{ $brand->id }}">{{ $brand->name }}</option>
                  @endforeach
                </select>
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          <!-- Card -->
          <div class="card card-outline card-primary">
            <div class="card-header">
              <h3 class="card-title">Organization</h3>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label>Category</label>
                <select class="form-control" name="subcategory" required>
                  <option value="" selected disabled>Select Category</option>
                  @foreach($sections as $section)
                  <optgroup label="{{ $section->name }}">
                    @foreach($section->product_categories as $category)
                    <optgroup label="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{ $category->name }}">
                      @foreach($category->product_subcategories as $subcategory)
                      <option value="{{ $subcategory->id }}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {{ $subcategory->name }} </option>
                      @endforeach
                    </optgroup>
                    @endforeach
                  </optgroup>
                  @endforeach
                </select>
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- /.card -->
          <!-- Card -->
          <div class="card card-outline card-primary">
            <div class="card-header">
              <h3 class="card-title">Taxes</h3>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label>Taxes Percentage</label>
                <select class="form-control" name="taxes" required>
                  <option value="14">14%</option>
                  <option value="0">0%</option>
                </select>
              </div>
            </div>
            <!-- /.card-body -->
          </div>
          <!-- Card -->
          <div class="card card-outline card-primary">
            <div class="card-header">
              <h3 class="card-title">Running Cost</h3>
            </div>
            <div class="card-body">
              <div class="form-group">
                <label>Running Cost Percentage</label>
                <select class="form-control" name="running_cost" required>
                  <option value="" selected disabled>Select Percentage</option>
                  @foreach($running_cost_percentages as $running_cost_percentage)
                  <option value="{{ $running_cost_percentage->percent }}">{{ $running_cost_percentage->percent }}%</option>
                  @endforeach
                </select>
              </div>
            </div>
            <!-- /.card-body -->
          </div>
        </div>
        <!--/.col (right) -->
        <div class="col-md-5 mx-auto">
          <button type="submit" class="btn btn-primary" style="width: 100%; margin-bottom: 20px;">Save Product</button>
        </div>
        <!--/.col (center) -->
      </div>
      <!-- /.row -->
    </div><!-- /.container-fluid -->
  </section>
  <!-- /.content -->
</form>
@endsection




@section('js')
<!-- Summernote -->
<script src="/admin_panel/plugins/summernote/summernote-bs4.min.js"></script>
<script>
  $(function () {
    // Summernote
    $('#description').summernote(
      {
        height: 245
      }
    )
  })
</script>
@endsection

